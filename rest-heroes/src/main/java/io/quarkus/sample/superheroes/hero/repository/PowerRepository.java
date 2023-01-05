package io.quarkus.sample.superheroes.hero.repository;

import javax.enterprise.context.ApplicationScoped;

import io.quarkus.hibernate.reactive.panache.PanacheRepositoryBase;
import io.quarkus.sample.superheroes.hero.Hero;
import io.quarkus.sample.superheroes.hero.Power;
import io.smallrye.mutiny.Uni;

/**
 * Repository class for managing data operations on a {@link Hero}.
 */
@ApplicationScoped
public class PowerRepository implements PanacheRepositoryBase<Power, Long> {
  public Uni<Power> findByName(String name) {
    return (name != null) ?
           find("name", name).singleResult().onFailure().recoverWithNull() :
           Uni.createFrom().nullItem();
  }
}
