package io.quarkus.sample.superheroes.hero.rest;

import static io.restassured.RestAssured.delete;
import static io.restassured.RestAssured.get;
import static io.restassured.RestAssured.given;
import static io.restassured.http.ContentType.JSON;
import static javax.ws.rs.core.MediaType.TEXT_PLAIN;
import static javax.ws.rs.core.Response.Status.BAD_REQUEST;
import static javax.ws.rs.core.Response.Status.CREATED;
import static javax.ws.rs.core.Response.Status.NOT_FOUND;
import static javax.ws.rs.core.Response.Status.NO_CONTENT;
import static javax.ws.rs.core.Response.Status.OK;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.containsString;
import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.blankOrNullString;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.is;

import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.ws.rs.core.HttpHeaders;

import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import io.quarkus.sample.superheroes.hero.Hero;
import io.quarkus.sample.superheroes.hero.Power;
import io.quarkus.test.junit.QuarkusIntegrationTest;
import io.restassured.common.mapper.TypeRef;

@QuarkusIntegrationTest
@TestMethodOrder(OrderAnnotation.class)
public class HeroResourceIT {
	private static final int DEFAULT_ORDER = 0;
	private static final String DEFAULT_NAME = "Super Chocolatine";
	private static final String UPDATED_NAME = DEFAULT_NAME + " (updated)";
	private static final String DEFAULT_OTHER_NAME = "Super Chocolatine chocolate in";
	private static final String UPDATED_OTHER_NAME = DEFAULT_OTHER_NAME + " (updated)";
	private static final String DEFAULT_PICTURE = "super_chocolatine.png";
	private static final String UPDATED_PICTURE = "super_chocolatine_updated.png";
	// private static final String DEFAULT_POWERS = "does not eat pain au chocolat";
	// private static final String UPDATED_POWERS = DEFAULT_POWERS + " (updated)";
	private static final Set<Power> DEFAULT_POWERS = Set.of(new Power("chocolat", "Base", 10, "", "does not eat pain au chocolat"));
	private static final Set<Power> UPDATED_POWERS = Set.of(new Power("dark chocolat", "Base", 99, "", "does not eat pain au dark chocolat"));
	private static final int DEFAULT_LEVEL = 42;
	private static final int UPDATED_LEVEL = DEFAULT_LEVEL + 1;

	private static final int NB_HEROES = 4; //100;
	private static String heroId;

	@Test
	@Order(DEFAULT_ORDER)
	public void helloEndpoint() {
		given()
			.when()
				.accept(TEXT_PLAIN)
				.get("/api/heroes/hello")
			.then()
				.statusCode(200)
				.body(is("Hello Hero Resource"));
	}

	@Test
	@Order(DEFAULT_ORDER)
	public void shouldNotGetUnknownHero() {
		get("/api/heroes/{id}", new Random().nextLong())
			.then().statusCode(NOT_FOUND.getStatusCode());
	}

	@Test
	@Order(DEFAULT_ORDER)
	public void shouldGetRandomHeroFound() {
		get("/api/heroes/random")
			.then()
				.statusCode(OK.getStatusCode())
				.contentType(JSON)
				.body("$", notNullValue());
	}

	@Test
	@Order(DEFAULT_ORDER)
	public void shouldNotAddInvalidItem() {
		var hero = new Hero();
		hero.setName(null);
		hero.setOtherName(DEFAULT_OTHER_NAME);
		hero.setPicture(DEFAULT_PICTURE);
		hero.addAllPowers(DEFAULT_POWERS);
		hero.setLevel(0);

		given()
			.when()
				.body(hero)
				.contentType(JSON)
				.accept(JSON)
				.post("/api/heroes")
			.then()
				.statusCode(BAD_REQUEST.getStatusCode());
	}

	@Test
	@Order(DEFAULT_ORDER)
	public void shouldNotFullyUpdateInvalidItem() {
		var hero = new Hero();
		hero.setId(1L);
		hero.setName(null);
		hero.setOtherName(UPDATED_OTHER_NAME);
		hero.setPicture(UPDATED_PICTURE);
		hero.updatePowers(UPDATED_POWERS);
		hero.setLevel(0);

		given()
			.when()
				.body(hero)
				.contentType(JSON)
				.accept(JSON)
				.put("/api/heroes/{id}", hero.getId())
			.then()
				.statusCode(BAD_REQUEST.getStatusCode());
	}

	@Test
	@Order(DEFAULT_ORDER)
	public void shouldNotPartiallyUpdateInvalidItem() {
		var hero = new Hero();
		hero.setId(1L);
		hero.setName(null);
		hero.setOtherName(UPDATED_OTHER_NAME);
		hero.setPicture(UPDATED_PICTURE);
		hero.updatePowers(UPDATED_POWERS);
		hero.setLevel(0);

		given()
			.when()
				.body(hero)
				.contentType(JSON)
				.accept(JSON)
				.patch("/api/heroes/{id}", hero.getId())
			.then()
				.statusCode(BAD_REQUEST.getStatusCode());
	}

	@Test
	@Order(DEFAULT_ORDER)
	public void shouldNotAddNullItem() {
		given()
			.when()
				.contentType(JSON)
				.accept(JSON)
				.post("/api/heroes")
			.then()
				.statusCode(BAD_REQUEST.getStatusCode());
	}

	@Test
	@Order(DEFAULT_ORDER)
	public void shouldNotFullyUpdateNullItem() {
		given()
			.when()
				.contentType(JSON)
				.accept(JSON)
				.body("")
				.put("/api/heroes/{id}", 1L)
			.then()
				.statusCode(BAD_REQUEST.getStatusCode());
	}

	@Test
	@Order(DEFAULT_ORDER)
	public void shouldNotFullyUpdateNotFoundItem() {
		Hero hero = new Hero();
		hero.setId(-1L);
		hero.setName(UPDATED_NAME);
		hero.setOtherName(UPDATED_OTHER_NAME);
		hero.setPicture(UPDATED_PICTURE);
		hero.updatePowers(UPDATED_POWERS);
		hero.setLevel(UPDATED_LEVEL);

		given()
			.when()
				.contentType(JSON)
				.accept(JSON)
				.body(hero)
				.put("/api/heroes/{id}", -1L)
			.then()
				.statusCode(NOT_FOUND.getStatusCode());
	}

	@Test
	@Order(DEFAULT_ORDER)
	public void shouldNotPartiallyUpdateNullItem() {
		given()
			.when()
				.contentType(JSON)
				.accept(JSON)
				.body("")
				.patch("/api/heroes/{id}", 1L)
			.then()
				.statusCode(BAD_REQUEST.getStatusCode());
	}

	@Test
	@Order(DEFAULT_ORDER)
	public void shouldNotPartiallyUpdateNotFoundItem() {
		Hero hero = new Hero();
		hero.setPicture(DEFAULT_PICTURE);
		hero.addAllPowers(DEFAULT_POWERS);

		given()
			.when()
				.contentType(JSON)
				.accept(JSON)
				.body(hero)
				.patch("/api/heroes/{id}", -1L)
			.then()
				.statusCode(NOT_FOUND.getStatusCode());
	}

  @Test
  @Order(DEFAULT_ORDER)
  public void shouldNotGetAnyHeroesThatDontMatchFilterCriteria() {
    given()
      .when()
        .queryParam("name_filter", "iooi90904890358349 8890re9ierkjlk;sdf098w459idxflkjdfjoiio4ue")
        .get("/api/heroes")
      .then()
        .statusCode(OK.getStatusCode())
        .body("size()", is(0));
  }

  @Test
  @Order(DEFAULT_ORDER)
  public void shouldGetHeroesThatMatchFilterCriteria() {
    given()
      .when()
        .queryParam("name_filter", "spid")
        .get("/api/heroes")
      .then()
        .statusCode(OK.getStatusCode())
        .body("size()", is(2))
        .body("[0].name", is("Spider-Man"))
        .body("[1].name", is("Spidey"));
  }

	@Test
	@Order(DEFAULT_ORDER + 1)
	public void shouldGetInitialItems() {
		get("/api/heroes")
			.then()
				.statusCode(OK.getStatusCode())
				.contentType(JSON)
				.body("size()", is(NB_HEROES));
	}

	@Test
	@Order(DEFAULT_ORDER + 2)
	public void shouldAddAnItem() {
		Hero hero = new Hero();
		hero.setName(DEFAULT_NAME);
		hero.setOtherName(DEFAULT_OTHER_NAME);
		hero.setPicture(DEFAULT_PICTURE);
		hero.addAllPowers(DEFAULT_POWERS);
		hero.setLevel(DEFAULT_LEVEL);

		String location = given()
			.when()
				.body(hero)
				.contentType(JSON)
				.accept(JSON)
				.post("/api/heroes")
			.then()
				.statusCode(CREATED.getStatusCode())
				.extract()
				.header(HttpHeaders.LOCATION);

		assertThat(location)
			.isNotBlank()
			.contains("/api/heroes");

		// Stores the id
		String[] segments = location.split("/");
		heroId = segments[segments.length - 1];

		assertThat(heroId)
			.isNotNull();

		get("/api/heroes/{id}", heroId)
			.then()
				.contentType(JSON)
				.statusCode(OK.getStatusCode())
				.body("name", is(DEFAULT_NAME))
				.body("otherName", is(DEFAULT_OTHER_NAME))
				.body("level", is(DEFAULT_LEVEL))
				.body("picture", is(DEFAULT_PICTURE))
				.body("powers", is(DEFAULT_POWERS));

    verifyNumberOfHeroes(NB_HEROES + 1);
	}

  private static void verifyNumberOfHeroes(int expected) {
    get("/api/heroes")
			.then()
				.statusCode(OK.getStatusCode())
				.contentType(JSON)
				.body("size()", is(expected));
  }

	@Test
	@Order(DEFAULT_ORDER + 3)
	public void shouldFullyUpdateAnItem() {
		Hero hero = new Hero();
		hero.setId(Long.valueOf(heroId));
		hero.setName(UPDATED_NAME);
		hero.setOtherName(UPDATED_OTHER_NAME);
		hero.setPicture(UPDATED_PICTURE);
		hero.updatePowers(UPDATED_POWERS);
		hero.setLevel(UPDATED_LEVEL);

		given()
			.when()
				.body(hero)
				.contentType(JSON)
				.accept(JSON)
				.put("/api/heroes/{id}", hero.getId())
			.then()
				.statusCode(NO_CONTENT.getStatusCode())
				.body(blankOrNullString());

		get("/api/heroes")
			.then()
				.statusCode(OK.getStatusCode())
				.contentType(JSON)
				.body("size()", is(NB_HEROES + 1));
	}

	@Test
	@Order(DEFAULT_ORDER + 4)
	public void shouldPartiallyUpdateAnItem() {
		Hero hero = new Hero();
		hero.setPicture(DEFAULT_PICTURE);
		hero.addAllPowers(DEFAULT_POWERS);

		given()
			.when()
				.body(hero)
				.contentType(JSON)
				.accept(JSON)
				.patch("/api/heroes/{id}", heroId)
			.then()
				.statusCode(OK.getStatusCode())
				.contentType(JSON)
				.body(
					"$", notNullValue(),
					"id", is(Integer.parseInt(heroId)),
					"name", is(UPDATED_NAME),
					"otherName", is(UPDATED_OTHER_NAME),
					"level", is(UPDATED_LEVEL),
					"picture", is(DEFAULT_PICTURE),
					"powers", is(DEFAULT_POWERS)
				);

		get("/api/heroes")
			.then()
				.statusCode(OK.getStatusCode())
				.contentType(JSON)
				.body("size()", is(NB_HEROES + 1));
	}

	@Test
	@Order(DEFAULT_ORDER + 5)
	public void shouldDeleteHero() {
		delete("/api/heroes/{id}", heroId)
			.then()
				.statusCode(NO_CONTENT.getStatusCode())
				.body(blankOrNullString());

		get("/api/heroes")
			.then()
				.statusCode(OK.getStatusCode())
				.contentType(JSON)
				.body("size()", is(NB_HEROES));
	}

	@Test
	@Order(DEFAULT_ORDER + 6)
	public void shouldDeleteAllHeros() {
		delete("/api/heroes/")
			.then()
				.statusCode(NO_CONTENT.getStatusCode())
				.body(blankOrNullString());

		get("/api/heroes")
			.then()
				.statusCode(OK.getStatusCode())
				.body("$.size()", is(0));
	}

	@Test
	@Order(DEFAULT_ORDER + 7)
	public void shouldGetRandomHeroNotFound() {
		get("/api/heroes/random")
			.then().statusCode(NOT_FOUND.getStatusCode());
	}

  @Test
  @Order(DEFAULT_ORDER + 8)
  public void shouldReplaceAllHeroes() {
    var h1 = new Hero();
    h1.setName(DEFAULT_NAME);
    h1.setOtherName(DEFAULT_OTHER_NAME);
    h1.setPicture(DEFAULT_PICTURE);
    h1.addAllPowers(DEFAULT_POWERS);
    h1.setLevel(DEFAULT_LEVEL);

    var h2 = new Hero();
    h2.setName(UPDATED_NAME);
    h2.setOtherName(UPDATED_OTHER_NAME);
    h2.setPicture(UPDATED_PICTURE);
    h2.updatePowers(UPDATED_POWERS);
    h2.setLevel(UPDATED_LEVEL);

		given()
			.when()
				.body(h1)
				.contentType(JSON)
				.accept(JSON)
				.post("/api/heroes")
			.then()
				.statusCode(CREATED.getStatusCode())
				.header(HttpHeaders.LOCATION, containsString("/api/heroes"));

    verifyNumberOfHeroes(1);

    given()
			.when()
				.body(List.of(h1, h2))
				.contentType(JSON)
				.accept(JSON)
				.put("/api/heroes")
			.then()
				.statusCode(CREATED.getStatusCode())
				.header(HttpHeaders.LOCATION, endsWith("/api/heroes"));

    List<Hero> heroes = get("/api/heroes")
			.then()
				.statusCode(OK.getStatusCode())
				.contentType(JSON)
			  // .body("$.size()", is(2),
        //   "[0].name", is(DEFAULT_NAME),
        //   "[0].otherName", is(DEFAULT_OTHER_NAME),
        //   "[0].picture", is(DEFAULT_PICTURE),
        //   "[0].powers", is(DEFAULT_POWERS),
        //   "[0].level", is(DEFAULT_LEVEL),
        //   "[1].name", is(UPDATED_NAME),
        //   "[1].otherName", is(UPDATED_OTHER_NAME),
        //   "[1].picture", is(UPDATED_PICTURE),
        //   "[1].powers", is(UPDATED_POWERS),
        //   "[1].level", is(UPDATED_LEVEL)
        // );
				.and()
				.extract().body()
				.as(new TypeRef<List<Hero>>() {});

		assertThat(heroes.size(), is(2));
		assertThat(heroes.get(0), notNullValue());
		assertThat(heroes.get(0).getName(), is(DEFAULT_NAME));
		assertThat(heroes.get(0).getOtherName(), is(DEFAULT_OTHER_NAME));
		assertThat(heroes.get(0).getLevel(), is(DEFAULT_LEVEL));
		assertThat(heroes.get(0).getPicture(), is(DEFAULT_PICTURE));
		assertThat(heroes.get(0).getPowers(), equalTo(DEFAULT_POWERS));
		assertThat(heroes.get(1), notNullValue());
		assertThat(heroes.get(1).getName(), is(UPDATED_NAME));
		assertThat(heroes.get(1).getOtherName(), is(UPDATED_OTHER_NAME));
		assertThat(heroes.get(1).getLevel(), is(UPDATED_LEVEL));
		assertThat(heroes.get(1).getPicture(), is(UPDATED_PICTURE));
		assertThat(heroes.get(1).getPowers(), equalTo(UPDATED_POWERS));
  }

	@Test
	public void shouldPingOpenAPI() {
		given()
			.when()
				.accept(JSON)
				.get("/q/openapi")
			.then()
				.statusCode(OK.getStatusCode());
	}
}
