package io.quarkus.sample.superheroes.fight.rest;

import static io.restassured.RestAssured.get;
import static io.restassured.RestAssured.given;
import static io.restassured.http.ContentType.JSON;
import static io.restassured.http.ContentType.TEXT;
import static javax.ws.rs.core.Response.Status.BAD_REQUEST;
import static javax.ws.rs.core.Response.Status.NOT_FOUND;
import static javax.ws.rs.core.Response.Status.OK;
import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.params.ParameterizedTest.ARGUMENTS_WITH_NAMES_PLACEHOLDER;
import static org.junit.jupiter.params.ParameterizedTest.DISPLAY_NAME_PLACEHOLDER;
import static org.junit.jupiter.params.ParameterizedTest.INDEX_PLACEHOLDER;
import static org.mockito.ArgumentMatchers.argThat;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.mockito.Mockito.when;

import java.time.Instant;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Stream;

import org.bson.types.ObjectId;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.mockito.ArgumentMatcher;

import io.quarkus.sample.superheroes.fight.Fight;
import io.quarkus.sample.superheroes.fight.Fighters;
import io.quarkus.sample.superheroes.fight.client.Hero;
import io.quarkus.sample.superheroes.fight.client.Power;
import io.quarkus.sample.superheroes.fight.client.Villain;
import io.quarkus.sample.superheroes.fight.service.FightService;
import io.quarkus.test.junit.QuarkusTest;
import io.quarkus.test.junit.mockito.InjectMock;
import io.smallrye.mutiny.Uni;

/**
 * Tests the resource layer ({@link FightResource} specifically).
 */
@QuarkusTest
public class FightResourceTests {
	private static final String DEFAULT_FIGHT_ID = new ObjectId().toString();
	private static final Instant DEFAULT_FIGHT_DATE = Instant.now();

	private static final String DEFAULT_HERO_NAME = "Super Baguette";
	private static final String DEFAULT_HERO_PICTURE = "super_baguette.png";
	private static final String DEFAULT_HERO_POWERS = "eats baguette really quickly";
	private static final int DEFAULT_HERO_LEVEL = 42;
	private static final String HEROES_TEAM_NAME = "heroes";

	private static final String DEFAULT_VILLAIN_NAME = "Super Chocolatine";
	private static final String DEFAULT_VILLAIN_PICTURE = "super_chocolatine.png";
	private static final Set<Power> DEFAULT_VILLAIN_POWERS = Set.of(new Power("chocoloat", "Base", 10, "chocolat.png", "does not eat pain au chocolat"));
	private static final int DEFAULT_VILLAIN_LEVEL = 40;
	private static final String VILLAINS_TEAM_NAME = "villains";

	@InjectMock
	FightService fightService;

	@Test
	public void helloEndpoint() {
		get("/api/fights/hello")
			.then()
			.statusCode(OK.getStatusCode())
			.contentType(TEXT)
			.body(is("Hello Fight Resource"));

		verifyNoInteractions(this.fightService);
	}

  @Test
  public void helloHeroesEndpoint() {
    when(this.fightService.helloHeroes())
      .thenReturn(Uni.createFrom().item("Hello Hero Resource"));

    get("/api/fights/hello/heroes")
      .then()
      .statusCode(OK.getStatusCode())
      .contentType(TEXT)
      .body(is("Hello Hero Resource"));

    verify(this.fightService).helloHeroes();
    verifyNoMoreInteractions(this.fightService);
  }

  @Test
  public void helloVillainsEndpoint() {
    when(this.fightService.helloVillains())
      .thenReturn(Uni.createFrom().item("Hello Villains Resource"));

    get("/api/fights/hello/villains")
      .then()
      .statusCode(OK.getStatusCode())
      .contentType(TEXT)
      .body(is("Hello Villains Resource"));

    verify(this.fightService).helloVillains();
    verifyNoMoreInteractions(this.fightService);
  }

  @Test
	public void shouldGetRandomFighters() {
		when(this.fightService.findRandomFighters())
			.thenReturn(Uni.createFrom().item(createDefaultFighters()));

		Fighters randomFighter = get("/api/fights/randomfighters")
			.then()
			.statusCode(OK.getStatusCode())
			.contentType(JSON)
			.and()
			.extract().as(Fighters.class);

		assertThat(randomFighter, notNullValue());
		assertThat(randomFighter.getHero(), notNullValue());
		assertThat(randomFighter.getHero().getName(), is(DEFAULT_HERO_NAME));
		assertThat(randomFighter.getHero().getLevel(), is(DEFAULT_HERO_LEVEL));
		assertThat(randomFighter.getHero().getPicture(), is(DEFAULT_HERO_PICTURE));
		assertThat(randomFighter.getHero().getPowers(), equalTo(DEFAULT_HERO_POWERS));
		assertThat(randomFighter.getVillain(), notNullValue());
		assertThat(randomFighter.getVillain().getName(), is(DEFAULT_VILLAIN_NAME));
		assertThat(randomFighter.getVillain().getLevel(), is(DEFAULT_VILLAIN_LEVEL));
		assertThat(randomFighter.getVillain().getPicture(), is(DEFAULT_VILLAIN_PICTURE));
		assertThat(randomFighter.getVillain().getPowers(), equalTo(DEFAULT_VILLAIN_POWERS));

		verify(this.fightService).findRandomFighters();
		verifyNoMoreInteractions(this.fightService);
	}

	@Test
	public void shouldGetNoFights() {
		when(this.fightService.findAllFights()).thenReturn(Uni.createFrom().item(List.of()));

		get("/api/fights")
			.then()
			.statusCode(OK.getStatusCode())
			.body("$.size()", is(0));

		verify(this.fightService).findAllFights();
		verifyNoMoreInteractions(this.fightService);
	}

	@Test
	public void shouldGetAllFights() {
		when(this.fightService.findAllFights())
			.thenReturn(Uni.createFrom().item(List.of(createFightHeroWon())));

		get("/api/fights")
			.then()
			.statusCode(OK.getStatusCode())
			.contentType(JSON)
			.body(
				"$.size()", is(1),
				"[0].id", is(DEFAULT_FIGHT_ID),
				"[0].fightDate", is(DEFAULT_FIGHT_DATE.toString()),
				"[0].winnerName", is(DEFAULT_HERO_NAME),
				"[0].winnerLevel", is(DEFAULT_HERO_LEVEL),
				"[0].winnerPicture", is(DEFAULT_HERO_PICTURE),
				"[0].winnerTeam", is(HEROES_TEAM_NAME),
				"[0].loserName", is(DEFAULT_VILLAIN_NAME),
				"[0].loserLevel", is(DEFAULT_VILLAIN_LEVEL),
				"[0].loserPicture", is(DEFAULT_VILLAIN_PICTURE),
				"[0].loserTeam", is(VILLAINS_TEAM_NAME)
			);

		verify(this.fightService).findAllFights();
		verifyNoMoreInteractions(this.fightService);
	}

	@Test
	public void shouldGetNoFightFound() {
		when(this.fightService.findFightById(eq(DEFAULT_FIGHT_ID)))
			.thenReturn(Uni.createFrom().nullItem());

		get("/api/fights/{id}", DEFAULT_FIGHT_ID)
			.then().statusCode(NOT_FOUND.getStatusCode());

		verify(this.fightService).findFightById(eq(DEFAULT_FIGHT_ID));
		verifyNoMoreInteractions(this.fightService);
	}

	@Test
	public void shouldGetFight() {
		when(this.fightService.findFightById(eq(DEFAULT_FIGHT_ID)))
			.thenReturn(Uni.createFrom().item(createFightHeroWon()));

		get("/api/fights/{id}", DEFAULT_FIGHT_ID)
			.then()
			.statusCode(OK.getStatusCode())
			.contentType(JSON)
			.body(
				"id", is(DEFAULT_FIGHT_ID),
				"fightDate", is(DEFAULT_FIGHT_DATE.toString()),
				"winnerName", is(DEFAULT_HERO_NAME),
				"winnerLevel", is(DEFAULT_HERO_LEVEL),
				"winnerPicture", is(DEFAULT_HERO_PICTURE),
				"winnerTeam", is(HEROES_TEAM_NAME),
				"loserName", is(DEFAULT_VILLAIN_NAME),
				"loserLevel", is(DEFAULT_VILLAIN_LEVEL),
				"loserPicture", is(DEFAULT_VILLAIN_PICTURE),
				"loserTeam", is(VILLAINS_TEAM_NAME)
			);

		verify(this.fightService).findFightById(eq(DEFAULT_FIGHT_ID));
		verifyNoMoreInteractions(this.fightService);
	}

	@Test
	public void shouldNotPerformFightNullFighters() {
		given()
			.when()
				.contentType(JSON)
				.accept(JSON)
				.post("/api/fights")
			.then()
				.statusCode(BAD_REQUEST.getStatusCode());

		verifyNoInteractions(this.fightService);
	}

	@ParameterizedTest(name = DISPLAY_NAME_PLACEHOLDER + "[" + INDEX_PLACEHOLDER + "] (" + ARGUMENTS_WITH_NAMES_PLACEHOLDER + ")")
	@MethodSource("invalidFighters")
	public void shouldNotPerformFightInvalidFighters(Fighters fighters) {
		given()
			.when()
				.contentType(JSON)
				.accept(JSON)
				.body(fighters)
				.post("/api/fights")
			.then()
				.statusCode(BAD_REQUEST.getStatusCode());

		verifyNoInteractions(this.fightService);
	}

	@Test
	public void shouldPerformFight() {
		var fightersMatcher = fightersMatcher(createDefaultFighters());

		when(this.fightService.performFight(argThat(fightersMatcher)))
			.thenReturn(Uni.createFrom().item(createFightHeroWon()));

		given()
			.when()
				.contentType(JSON)
				.accept(JSON)
				.body(createDefaultFighters())
				.post("/api/fights")
			.then()
				.statusCode(OK.getStatusCode())
				.contentType(JSON)
				.body(
					"id", is(DEFAULT_FIGHT_ID),
					"fightDate", is(DEFAULT_FIGHT_DATE.toString()),
					"winnerName", is(DEFAULT_HERO_NAME),
					"winnerLevel", is(DEFAULT_HERO_LEVEL),
					"winnerPicture", is(DEFAULT_HERO_PICTURE),
					"winnerTeam", is(HEROES_TEAM_NAME),
					"loserName", is(DEFAULT_VILLAIN_NAME),
					"loserLevel", is(DEFAULT_VILLAIN_LEVEL),
					"loserPicture", is(DEFAULT_VILLAIN_PICTURE),
					"loserTeam", is(VILLAINS_TEAM_NAME)
				);

		verify(this.fightService).performFight(argThat(fightersMatcher));
		verifyNoMoreInteractions(this.fightService);
	}

	@Test
	public void shouldPingOpenAPI() {
		get("/q/openapi")
			.then().statusCode(OK.getStatusCode());
	}

	private static Stream<Fighters> invalidFighters() {
		return Stream.of(
			new Fighters(),
			new Fighters(createDefaultHero(), null),
			new Fighters(null, createDefaultVillain()),
			new Fighters(new Hero(null, DEFAULT_HERO_LEVEL, DEFAULT_HERO_PICTURE, DEFAULT_HERO_POWERS), createDefaultVillain()),
			new Fighters(new Hero("", DEFAULT_HERO_LEVEL, DEFAULT_HERO_PICTURE, DEFAULT_HERO_POWERS), createDefaultVillain()),
			new Fighters(new Hero(DEFAULT_HERO_NAME, DEFAULT_HERO_LEVEL, "", DEFAULT_HERO_POWERS), createDefaultVillain()),
			new Fighters(createDefaultHero(), new Villain(null, DEFAULT_VILLAIN_LEVEL, DEFAULT_VILLAIN_PICTURE, DEFAULT_VILLAIN_POWERS)),
			new Fighters(createDefaultHero(), new Villain("", DEFAULT_VILLAIN_LEVEL, DEFAULT_VILLAIN_PICTURE, DEFAULT_VILLAIN_POWERS)),
			new Fighters(createDefaultHero(), new Villain(DEFAULT_VILLAIN_NAME, DEFAULT_VILLAIN_LEVEL, "", DEFAULT_VILLAIN_POWERS))
		);
	}

	private static Hero createDefaultHero() {
		return new Hero(
			DEFAULT_HERO_NAME,
			DEFAULT_HERO_LEVEL,
			DEFAULT_HERO_PICTURE,
			DEFAULT_HERO_POWERS
		);
	}

	private static Villain createDefaultVillain() {
		return new Villain(
			DEFAULT_VILLAIN_NAME,
			DEFAULT_VILLAIN_LEVEL,
			DEFAULT_VILLAIN_PICTURE,
			DEFAULT_VILLAIN_POWERS
		);
	}

	private static Fighters createDefaultFighters() {
		return new Fighters(createDefaultHero(), createDefaultVillain());
	}

	private static Fight createFightHeroWon() {
		var fight = new Fight();
		fight.id = new ObjectId(DEFAULT_FIGHT_ID);
		fight.fightDate = DEFAULT_FIGHT_DATE;
		fight.winnerName = DEFAULT_HERO_NAME;
		fight.winnerLevel = DEFAULT_HERO_LEVEL;
		fight.winnerPicture = DEFAULT_HERO_PICTURE;
		fight.loserName = DEFAULT_VILLAIN_NAME;
		fight.loserLevel = DEFAULT_VILLAIN_LEVEL;
		fight.loserPicture = DEFAULT_VILLAIN_PICTURE;
		fight.winnerTeam = HEROES_TEAM_NAME;
		fight.loserTeam = VILLAINS_TEAM_NAME;

		return fight;
	}

	private static ArgumentMatcher<Hero> heroMatcher(Hero hero) {
		return h -> (hero == h) || (
			(hero != null) &&
				(h != null) &&
				Objects.equals(hero.getName(), h.getName()) &&
				Objects.equals(hero.getLevel(), h.getLevel()) &&
				Objects.equals(hero.getPicture(), h.getPicture()) &&
				Objects.equals(hero.getPowers(), h.getPowers())
		);
	}

	private static ArgumentMatcher<Villain> villainMatcher(Villain villain) {
		return v -> (villain == v) || (
			(villain != null) &&
				(v != null) &&
				Objects.equals(villain.getName(), v.getName()) &&
				Objects.equals(villain.getLevel(), v.getLevel()) &&
				Objects.equals(villain.getPicture(), v.getPicture()) &&
				Objects.equals(villain.getPowers(), v.getPowers())
		);
	}

	private static ArgumentMatcher<Fighters> fightersMatcher(Fighters fighters) {
		return f -> (fighters == f) || (
			(fighters != null) &&
				(f != null) &&
				heroMatcher(f.getHero()).matches(fighters.getHero()) &&
				villainMatcher(f.getVillain()).matches(fighters.getVillain())
		);
	}
}
