package io.quarkus.sample.superheroes.villain;

import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Random;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
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

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;

/**
 * JPA entity class for a Villain. Re-used in the API layer.
 */
@Entity
public class Villain extends PanacheEntityBase {
  @Id
  @SequenceGenerator(
          name = "villainSequence",
          sequenceName = "villain_id_seq",
          allocationSize = 1,
          initialValue = 1)
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "villainSequence")
  public Long id;
		
	@NotNull
	@Size(min = 3, max = 50)
	public String name;

	public String otherName;

	@NotNull
	@Positive
	public Integer level;

	public String picture;

	@ManyToMany(cascade = {
		CascadeType.PERSIST,
		CascadeType.MERGE
	})
	@JoinTable(name = "villain_power",
    joinColumns = @JoinColumn(name = "villain_id"),
    inverseJoinColumns = @JoinColumn(name = "power_id")
	)
	private Set<Power> powers = new HashSet<>();

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
		power.getVillains().add(this);
	}

	public void removePower(Power power) {
			powers.remove(power);
			power.getVillains().remove(this);
	}

	private void removeAllPowers() {
		powers.forEach(this::removePower);
	}

	public void updatePowers(Set<Power> powers) {
		this.removeAllPowers();
		powers.forEach(this::addPower);
	}

	public void addAllPowers(Set<Power> powers) {
		powers.forEach(this::addPower);
	}

	public static Optional<Villain> findRandom() {
		var countVillains = count();

		if (countVillains > 0) {
			var randomVillain = new Random().nextInt((int) countVillains);
			return findAll().page(randomVillain, 1).firstResultOptional();
		}

		return Optional.empty();
	}

  public static List<Villain> listAllWhereNameLike(String name) {
    return (name != null) ?
           list("LOWER(name) LIKE CONCAT('%', ?1, '%')", name.toLowerCase()) :
           List.of();
  }

	@Override
	/* prettier-ignore */
	public String toString() {
		return (
			"Villain{" +
				"id=" + this.id +
				", name='" + this.name + '\'' +
				", otherName='" + this.otherName + '\'' +
				", level=" + this.level +
				", picture='" + this.picture + '\'' +
				", powers='" + this.powers + '\'' +
				'}'
		);
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) {
			return true;
		}
		if (o == null || getClass() != o.getClass()) {
			return false;
		}
		Villain villain = (Villain) o;
		return id != null && this.id.equals(villain.id);
	}

	@Override
	public int hashCode() {
		return Objects.hash(this.id);
	}
}
