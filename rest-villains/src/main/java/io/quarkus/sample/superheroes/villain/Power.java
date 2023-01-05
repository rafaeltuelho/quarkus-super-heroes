package io.quarkus.sample.superheroes.villain;

import java.util.HashSet;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.NaturalId;

import com.fasterxml.jackson.annotation.JsonIgnore;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import io.smallrye.common.constraint.NotNull;

@Entity
public class Power extends PanacheEntityBase {
  @Id
  @SequenceGenerator(
          name = "powerSequence",
          sequenceName = "power_id_seq",
          allocationSize = 1,
          initialValue = 1)
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "powerSequence")
  public Long id;
  @NotNull
  @NaturalId
  public String name;
  public String tier;
  public int score = 0;
  public String aliases;
  @Column(columnDefinition = "TEXT")
  public String description;
  @ManyToMany(mappedBy = "powers")
  @JsonIgnore
  private Set<Villain> villains = new HashSet<>();

  public Power() {
    
  }

  public Power(String name, String tier, int score, String aliases, String description) {
    this.name = name;
    this.tier = tier;
    this.score = score;
    this.aliases = aliases;
    this.description = description;
  }

  public static Optional<Power> findByName(final String name) {
    return find("name", name).singleResultOptional();
  }

  public Set<Villain> getVillains() {
    return villains;
  }

  public void setVillains(Set<Villain> villains) {
    this.villains = villains;
  }

  @Override
  public int hashCode() {
    return Objects.hashCode(name);
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null || getClass() != obj.getClass())
      return false;
    Power other = (Power) obj;
    return name.equalsIgnoreCase(other.name);
  }

  @Override
  public String toString() {
    return "Power [id=" + id + ", aliases=" + aliases + ", description=" + description + ", name=" + name + ", score=" + score
        + ", tier=" + tier + "]";
  }

}


