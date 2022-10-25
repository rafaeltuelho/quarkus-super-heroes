package io.quarkus.sample.superheroes.villain;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.params.ParameterizedTest.ARGUMENTS_WITH_NAMES_PLACEHOLDER;
import static org.junit.jupiter.params.ParameterizedTest.DISPLAY_NAME_PLACEHOLDER;
import static org.junit.jupiter.params.ParameterizedTest.INDEX_PLACEHOLDER;

import java.util.Set;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EmptySource;
import org.junit.jupiter.params.provider.NullSource;
import org.junit.jupiter.params.provider.ValueSource;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
class VillainTests {
	private static final String DEFAULT_NAME = "Super Chocolatine";
	private static final String DEFAULT_OTHER_NAME = "Super Chocolatine chocolate in";
	private static final String DEFAULT_PICTURE = "super_chocolatine.png";
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

	@Test
	public void findRandomNotFound() {
		Villain.deleteAll();
		assertThat(Villain.count())
			.isEqualTo(0);

		assertThat(Villain.findRandom())
			.isNotNull()
			.isEmpty();
	}

	@Test
	public void findRandomFound() {
		Villain villain = new Villain();
		villain.name = DEFAULT_NAME;
		villain.otherName = DEFAULT_OTHER_NAME;
		villain.picture = DEFAULT_PICTURE;
    villain.addAllPowers(defaultPowers());
		villain.level = DEFAULT_LEVEL;

		Villain.deleteAll();
		Villain.persist(villain);

		assertThat(Villain.count())
			.isEqualTo(1L);

		var v = Villain.findRandom();

		assertThat(v)
			.isNotNull()
			.isPresent()
			.get()
			.usingRecursiveComparison()
			.isEqualTo(villain);

		assertThat(v.get().id)
			.isNotNull()
			.isPositive();
	}

  @ParameterizedTest(name = DISPLAY_NAME_PLACEHOLDER + "[" + INDEX_PLACEHOLDER + "] (" + ARGUMENTS_WITH_NAMES_PLACEHOLDER + ")")
  @ValueSource(strings = { DEFAULT_NAME, "choco", "Choco", "CHOCO", "Chocolatine", "super", "l" })
  @EmptySource
  public void findAllWhereNameLikeFound(String name) {
    var villain = new Villain();
    villain.name = DEFAULT_NAME;
    villain.otherName = DEFAULT_OTHER_NAME;
    villain.picture = DEFAULT_PICTURE;
    villain.addAllPowers(defaultPowers());
    villain.level = DEFAULT_LEVEL;

    Villain.deleteAll();
    Villain.persist(villain);

    assertThat(Villain.count())
      .isEqualTo(1L);

    assertThat(Villain.listAllWhereNameLike(name))
      .isNotNull()
      .hasSize(1)
      .first()
      .usingRecursiveComparison()
      .isEqualTo(villain);
  }

  @ParameterizedTest(name = DISPLAY_NAME_PLACEHOLDER + "[" + INDEX_PLACEHOLDER + "] (" + ARGUMENTS_WITH_NAMES_PLACEHOLDER + ")")
  @ValueSource(strings = { "v", "support", "chocolate" })
  @NullSource
  public void findAllWhereNameLikeNotFound(String name) {
    var villain = new Villain();
    villain.name = DEFAULT_NAME;
    villain.otherName = DEFAULT_OTHER_NAME;
    villain.picture = DEFAULT_PICTURE;
    villain.addAllPowers(defaultPowers());
    villain.level = DEFAULT_LEVEL;

    Villain.deleteAll();
    Villain.persist(villain);

    assertThat(Villain.count())
      .isEqualTo(1L);

    assertThat(Villain.listAllWhereNameLike(name))
      .isNotNull()
      .isEmpty();
  }

  @Test
  @TestTransaction
  public void persistMultipleVillainsSharingPowers() {
    Power p1 = new Power("apple juice", "Base", 13, "", "likes apple juice");
    Power p2 = new Power("Super mega power", "Top", 99, "", "power max");

    Villain v1 = new Villain();
		v1.name = DEFAULT_NAME;
		v1.otherName = DEFAULT_OTHER_NAME;
		v1.picture = DEFAULT_PICTURE;
    v1.addPower(p1);
    v1.addPower(p2);
		v1.level = DEFAULT_LEVEL;

    Villain v2 = new Villain();
		v2.name = "Super Two";
		v2.otherName = "";
		v2.picture = "SuperTwo.png";
    v2.addPower(p2);
		v2.level = 10;

		Villain.deleteAll();
		Villain.persist(v1);
		Villain.persist(v2);

		assertThat(Villain.count())
			.isEqualTo(2L);
    assertThat(v1.getPowers().containsAll(v2.getPowers()))
			.isTrue();
  }
}
