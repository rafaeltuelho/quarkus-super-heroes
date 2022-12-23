package io.quarkus.sample.superheroes.hero.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.enterprise.context.ApplicationScoped;
import javax.validation.ConstraintViolationException;
import javax.validation.Valid;
import javax.validation.Validator;
import javax.validation.constraints.NotNull;

import io.opentelemetry.instrumentation.annotations.SpanAttribute;
import io.opentelemetry.instrumentation.annotations.WithSpan;
import io.quarkus.hibernate.reactive.panache.common.runtime.ReactiveTransactional;
import io.quarkus.logging.Log;
import io.quarkus.sample.superheroes.hero.Hero;
import io.quarkus.sample.superheroes.hero.Power;
import io.quarkus.sample.superheroes.hero.mapping.HeroFullUpdateMapper;
import io.quarkus.sample.superheroes.hero.mapping.HeroPartialUpdateMapper;
import io.quarkus.sample.superheroes.hero.repository.HeroRepository;
import io.quarkus.sample.superheroes.hero.repository.PowerRepository;
import io.smallrye.mutiny.Multi;
import io.smallrye.mutiny.Uni;

/**
 * Service class containing business methods for the application.
 */
@ApplicationScoped
public class HeroService {
	private final HeroRepository heroRepository;
	private final PowerRepository powerRepository;
	private final Validator validator;
	private final HeroPartialUpdateMapper heroPartialUpdateMapper;
	private final HeroFullUpdateMapper heroFullUpdateMapper;

	public HeroService(HeroRepository heroRepository, PowerRepository powerRepository, Validator validator, HeroPartialUpdateMapper heroPartialUpdateMapper, HeroFullUpdateMapper heroFullUpdateMapper) {
		this.heroRepository = heroRepository;
		this.powerRepository = powerRepository;
		this.validator = validator;
		this.heroPartialUpdateMapper = heroPartialUpdateMapper;
		this.heroFullUpdateMapper = heroFullUpdateMapper;
	}

  @WithSpan("HeroService.findAllHeroes")
	public Uni<List<Hero>> findAllHeroes() {
    Log.debug("Getting all heroes");
		return this.heroRepository.listAll();
	}

  @WithSpan("HeroService.findAllHeroesHavingName")
  public Uni<List<Hero>> findAllHeroesHavingName(@SpanAttribute("arg.name") String name) {
    Log.debugf("Finding all heroes having name = %s", name);
    return this.heroRepository.listAllWhereNameLike(name);
  }

  @WithSpan("HeroService.findHeroById")
	public Uni<Hero> findHeroById(@SpanAttribute("arg.id") Long id) {
    Log.debugf("Finding hero by id = %d", id);
		return this.heroRepository.findById(id);
	}

  @WithSpan("HeroService.findRandomHero")
	public Uni<Hero> findRandomHero() {
    Log.debug("Finding a random hero");
		return this.heroRepository.findRandom();
	}

	@ReactiveTransactional
  @WithSpan("HeroService.persistHero")
	public Uni<Hero> persistHero(@SpanAttribute("arg.hero") @NotNull @Valid Hero hero) {
    Log.debugf("Persisting hero: %s", hero);
		hero.updatePowers(filteredSetOfPowers(hero));
		return this.heroRepository.persist(hero);
	}

	@ReactiveTransactional
  @WithSpan("HeroService.replaceHero")
	public Uni<Hero> replaceHero(@SpanAttribute("arg.hero") @NotNull @Valid Hero hero) {
    Log.debugf("Replacing hero: %s", hero);
		return this.heroRepository.findById(hero.getId())
			.onItem().ifNotNull().transform(h -> {
				this.heroFullUpdateMapper.mapFullUpdate(hero, h);
				return h;
			});
	}

	@ReactiveTransactional
  @WithSpan("HeroService.partialUpdateHero")
	public Uni<Hero> partialUpdateHero(@SpanAttribute("arg.hero") @NotNull Hero hero) {
    Log.debugf("Partially updating hero: %s", hero);
		return this.heroRepository.findById(hero.getId())
			.onItem().ifNotNull().transform(h -> {
				hero.updatePowers(filteredSetOfPowers(hero));
				this.heroPartialUpdateMapper.mapPartialUpdate(hero, h);
				return h;
			})
			.onItem().ifNotNull().transform(this::validatePartialUpdate);
	}

  @ReactiveTransactional
  @WithSpan("HeroService.replaceAllHeroes")
  public Uni<Void> replaceAllHeroes(@SpanAttribute("arg.heroes") List<Hero> heroes) {
    Log.debug("Replacing all heroes");
		heroes.forEach((v) -> {
			v.updatePowers(filteredSetOfPowers(v));
		});
    return deleteAllHeroes()
      .replaceWith(this.heroRepository.persist(heroes));
  }

	/**
	 * Validates a {@link Hero} for partial update according to annotation validation rules on the {@link Hero} object.
	 * @param hero The {@link Hero}
	 * @return The same {@link Hero} that was passed in, assuming it passes validation. The return is used as a convenience so the method can be called in a functional pipeline.
	 * @throws ConstraintViolationException If validation fails
	 */
	private Hero validatePartialUpdate(Hero hero) {
		var violations = this.validator.validate(hero);

		if ((violations != null) && !violations.isEmpty()) {
			throw new ConstraintViolationException(violations);
		}

		return hero;
	}

	@ReactiveTransactional
  @WithSpan("HeroService.deleteAllHeroes")
	public Uni<Void> deleteAllHeroes() {
    Log.debug("Deleting all heroes");
		return this.heroRepository.listAll()
			.onItem().transformToMulti(list -> Multi.createFrom().iterable(list))
			.map(Hero::getId)
			.onItem().transformToUniAndMerge(this::deleteHero)
			.collect().asList()
			.replaceWithVoid();
	}

	@ReactiveTransactional
  @WithSpan("HeroService.deleteHero")
	public Uni<Void> deleteHero(@SpanAttribute("arg.id") Long id) {
    Log.debugf("Deleting hero by id = %d", id);
		return this.heroRepository.deleteById(id).replaceWithVoid();
	}

	/**
	 * Check if any power associated with {@code Hero} already exist in the DB to avoid duplication issues
	 * @param hero
	 * @return {@code Set<Power>} A new Set of Power containing both managed and detached Power instances
	 */
	private Set<Power> filteredSetOfPowers(Hero hero) {
		Log.debugf("check if any power already exist in the DB to avoid duplication issues: %s", hero.getPowers());
		Set<Power> newPowers = new HashSet<>();
		hero.getPowers().forEach(p -> {
			this.powerRepository.findByName(p.getName())
			.onItem()
			.ifNotNull()
			.invoke(persistedPower -> {
				Log.debugf("Power [%s] already exist in the Database. It will be just associated with this Hero instance.", persistedPower.getName());
				newPowers.add(persistedPower); // replace by the already persisted power. Thus it will be just updated?!
			})
			.onItem()
			.ifNull()
			.continueWith(() -> {
				Log.debugf("Power [%s] doesn't exist yet. It will be persisted and the associated with this Hero.", p.getName());
				newPowers.add(p); // add as a new Power
				return p;
			});
		});
		return newPowers;
	}
}
