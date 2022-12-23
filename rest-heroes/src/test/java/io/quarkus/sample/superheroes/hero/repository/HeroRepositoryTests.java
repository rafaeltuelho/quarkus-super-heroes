package io.quarkus.sample.superheroes.hero.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Set;
import java.util.stream.Stream;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import io.quarkus.hibernate.reactive.panache.Panache;
import io.quarkus.logging.Log;
import io.quarkus.sample.superheroes.hero.Hero;
import io.quarkus.sample.superheroes.hero.Power;
import io.quarkus.test.TestReactiveTransaction;
import io.quarkus.test.junit.QuarkusTest;
import io.quarkus.test.vertx.UniAsserter;

@QuarkusTest
@TestReactiveTransaction
class HeroRepositoryTests {
	private static final String DEFAULT_NAME = "Super Chocolatine";
	private static final String DEFAULT_OTHER_NAME = "Super Chocolatine chocolate in";
	private static final String DEFAULT_PICTURE = "super_chocolatine.png";
	// private static final String DEFAULT_POWERS = "does not eat pain au chocolat";
	private static final int DEFAULT_LEVEL = 42;
  /** 
   * create a new set of Powers for each test  to avoid Detached Entity issues
   */
  private Set<Power> defaultPowers() {
    return Set.of(
      new Power("chocolat", "Base", 10, "", "does not eat pain au chocolat"),
      new Power("apple juice", "Base", 13, "", "likes apple juice")
    );
  }
  	
	@Inject
	HeroRepository heroRepository;

  @Inject
	PowerRepository powerRepository;

	@Test
  @TestReactiveTransaction
	public void findRandomNotFound(UniAsserter asserter) {
    asserter.assertNotNull(() -> Panache.currentTransaction());
    asserter.assertThat(this.heroRepository::deleteAll, n -> assertThat(n).isGreaterThan(0L));

    asserter.assertThat(
      this.heroRepository::count, 
      count -> assertThat(count).isEqualTo(0L)
    );

    asserter.assertThat(
      this.heroRepository::findRandom,
      hero -> assertThat(hero).isNull()
    );
	}
	
	@Test
	public void findRandomFound(UniAsserter asserter) {
		Hero hero = new Hero();
		hero.setName(DEFAULT_NAME);
		hero.setOtherName(DEFAULT_OTHER_NAME);
		hero.setPicture(DEFAULT_PICTURE);
		// hero.setPowers(DEFAULT_POWERS);
    hero.addAllPowers(defaultPowers());
		hero.setLevel(DEFAULT_LEVEL);

		asserter.execute(this.heroRepository::deleteAll)
			.assertEquals(this.heroRepository::count, 0L)
			.execute(() -> this.heroRepository.persist(hero))
			.assertEquals(this.heroRepository::count, 1L)
			.assertThat(
				this.heroRepository::findRandom,
				h -> {
					assertThat(h)
						.isNotNull()
						.usingRecursiveComparison()
						.isEqualTo(hero);

					assertThat(h.getId())
						.isNotNull()
						.isPositive();
				}
			);
	}

  @Test
  public void findAllWhereNameLikeFound(UniAsserter asserter) {
    // Doing it this way because UniAsserter doesn't work well with ParameterizedTest
    var names = Stream.of(DEFAULT_NAME, "choco", "Choco", "CHOCO", "Chocolatine", "super", "l", "");

    Hero hero = new Hero();
    hero.setName(DEFAULT_NAME);
    hero.setOtherName(DEFAULT_OTHER_NAME);
    hero.setPicture(DEFAULT_PICTURE);
    // hero.setPowers(DEFAULT_POWERS);
    hero.addAllPowers(defaultPowers());
    hero.setLevel(DEFAULT_LEVEL);

    asserter.execute(this.heroRepository::deleteAll)
      .assertEquals(this.heroRepository::count, 0L)
      .execute(() -> this.heroRepository.persist(hero))
      .assertEquals(this.heroRepository::count, 1L);

    names.forEach(name ->
      asserter.execute(() -> Log.infof("Inside listAllWhereNameLike(%s)", name))
        .assertThat(
          () -> this.heroRepository.listAllWhereNameLike(name),
          heroes ->
            assertThat(heroes)
              .isNotNull()
              .hasSize(1)
              .first()
              .usingRecursiveComparison()
              .isEqualTo(hero)
        )
    );
  }

  @Test
  public void findAllWhereNameLikeNotFound(UniAsserter asserter) {
    // Doing it this way because UniAsserter doesn't work well with ParameterizedTest
    var names = Stream.of("v", "support", "chocolate", null);

    Hero hero = new Hero();
    hero.setName(DEFAULT_NAME);
    hero.setOtherName(DEFAULT_OTHER_NAME);
    hero.setPicture(DEFAULT_PICTURE);
    // hero.setPowers(DEFAULT_POWERS);
    hero.addAllPowers(defaultPowers());
    hero.setLevel(DEFAULT_LEVEL);

    asserter.execute(this.heroRepository::deleteAll)
      .assertEquals(this.heroRepository::count, 0L)
      .execute(() -> this.heroRepository.persist(hero))
      .assertEquals(this.heroRepository::count, 1L);

    names.forEach(name ->
      asserter.execute(() -> Log.infof("Inside findAllWhereNameLikeNotFound(%s)", name))
        .assertThat(
          () -> this.heroRepository.listAllWhereNameLike(name),
          heroes ->
            assertThat(heroes)
              .isNotNull()
              .isEmpty()
        )
    );
  }
}
