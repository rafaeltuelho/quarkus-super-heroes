package io.quarkus.sample.superheroes.hero.repository;

import java.util.List;
import java.util.Random;

import javax.enterprise.context.ApplicationScoped;

import org.jboss.logging.Logger;

import io.quarkus.hibernate.reactive.panache.PanacheRepositoryBase;
import io.quarkus.sample.superheroes.hero.Hero;
import io.smallrye.mutiny.Multi;
import io.smallrye.mutiny.Uni;

/**
 * Repository class for managing data operations on a {@link Hero}.
 */
@ApplicationScoped
public class HeroRepository implements PanacheRepositoryBase<Hero, Long> {
	private final Logger logger = Logger.getLogger(getClass());

	public Uni<Hero> findRandom() {
		return count()
			.map(count -> (count > 0) ? count : null)
			.onItem().ifNotNull().transform(count -> new Random().nextInt(count.intValue()))
			.onItem().ifNotNull().transformToUni(randomHero -> findAll().page(randomHero, 1).firstResult());
	}

  public Uni<List<Hero>> listAllWhereNameLike(String name) {
    return (name != null) ?
           list("LOWER(name) LIKE CONCAT('%', ?1, '%')", name.toLowerCase()) :
           Uni.createFrom().item(List::of);
  }

	@Override
	public Uni<Long> deleteAll() {
		logger.debug("deleteAll() overridden to handle JPA association on Reactive mode...");
		return findAll()
		.list()
		.onItem().ifNotNull().transformToMulti(list -> Multi.createFrom().iterable(list))
		.map(Hero::getId)
		.onItem().transformToUniAndMerge(this::deleteById)
		.collect().asList().onItem().transformToUni(list -> {
			logger.info("deleted: " + list.size());
			return Uni.createFrom().item((long)list.size());
		});
	}
}
