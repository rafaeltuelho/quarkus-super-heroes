package io.quarkus.sample.superheroes.fight.client;

import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.eclipse.microprofile.openapi.annotations.media.Schema;

/**
 * POJO representing a Villain response from the Villain service
 */
@Schema(description = "The villain fighting against the hero")
public class Villain {
	@NotEmpty
	private String name;

	@NotNull
	private int level;

	@NotEmpty
	private String picture;

	private Set<Power> powers = new HashSet<>();

	public Villain(String name, int level, String picture, Set<Power> powers) {
		this.name = name;
		this.level = level;
		this.picture = picture;
		this.powers = powers;
	}

	public Villain() {
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getLevel() {
		return this.level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Set<Power> getPowers() {
		return this.powers;
	}

	public void setPowers(Set<Power> powers) {
		this.powers = powers;
	}

	@Override
	public String toString() {
		return "Villain{" +
			"name='" + this.name + '\'' +
			", level=" + this.level +
			", picture='" + this.picture + '\'' +
			", powers='" + this.powers + '\'' +
			'}';
	}
}
