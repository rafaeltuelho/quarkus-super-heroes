package io.quarkus.sample.superheroes.hero;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

/**
 * JPA entity class for a Hero. Re-used in the API layer.
 */
@Entity
public class Hero {
  @Id
  @SequenceGenerator(
          name = "heroSequence",
          sequenceName = "hero_id_seq",
          allocationSize = 1,
          initialValue = 1)
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "heroSequence")
  private Long id;

	@NotNull
	@Size(min = 3, max = 50)
	private String name;

	private String otherName;

	@NotNull
	@Positive
	private Integer level;

	private String picture;

	@ManyToMany(cascade = {
		CascadeType.PERSIST,
		CascadeType.MERGE
	},
	fetch = FetchType.EAGER)
	@JoinTable(name = "hero_power",
    joinColumns = @JoinColumn(name = "hero_id"),
    inverseJoinColumns = @JoinColumn(name = "power_id")
	)
	private Set<Power> powers = new HashSet<>();

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOtherName() {
		return this.otherName;
	}

	public void setOtherName(String otherName) {
		this.otherName = otherName;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	/**
	 * Returns a Set of Powers associated to this Villain
	 * @return {@code Collections.unmodifiableSet(Set<Power>)}
	 */
  public Set<Power> getPowers() {
    return powers;
    // return Collections.unmodifiableSet(powers);
  }

	public void addPower(Power power) {
		powers.add(power);
		power.getHeroes().add(this);
	}

	public void removePower(Power power) {
			powers.remove(power);
			// power.getHeroes().remove(this);
	}

	public void removeAllPowers() {
		powers.forEach(this::removePower);
	}

	public void updatePowers(Set<Power> powers) {
		this.removeAllPowers();
		powers.forEach(this::addPower);
	}

	public void addAllPowers(Set<Power> powers) {
		powers.forEach(this::addPower);
	}	

	@Override
	public String toString() {
		return "Hero{" +
			"id=" + this.id +
			", name='" + this.name + '\'' +
			", otherName='" + this.otherName + '\'' +
			", level=" + this.level +
			", picture='" + this.picture + '\'' +
			// ", powers='" + this.powers + '\'' +
			'}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) {
			return true;
		}
		if (o == null || getClass() != o.getClass()) {
			return false;
		}
		Hero hero = (Hero) o;
		return this.id.equals(hero.id);
	}

	@Override
	public int hashCode() {
		return Objects.hash(this.id);
	}
}
