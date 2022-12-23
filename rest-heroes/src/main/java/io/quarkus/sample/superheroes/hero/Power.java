package io.quarkus.sample.superheroes.hero;

import java.util.HashSet;
import java.util.Objects;
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

import io.smallrye.common.constraint.NotNull;

@Entity
public class Power {
  @Id
  @SequenceGenerator(
          name = "powerSequence",
          sequenceName = "power_id_seq",
          allocationSize = 1,
          initialValue = 1)
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "powerSequence")
  private Long id;
  
  @NotNull
  @NaturalId
  private String name;
  private String tier;
  private int score = 0;
  private String aliases;

  @Column(columnDefinition = "TEXT")
  private String description;

  @ManyToMany(mappedBy = "powers")
  @JsonIgnore
  private Set<Hero> heroes = new HashSet<>();

  public Power() {
    
  }

  public Power(String name, String tier, int score, String aliases, String description) {
    this.name = name;
    this.tier = tier;
    this.score = score;
    this.aliases = aliases;
    this.description = description;
  }

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

  public String getTier() {
    return this.tier;
  }

  public void setTier(String tier) {
    this.tier = tier;
  }

  public int getScore() {
    return this.score;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public String getAliases() {
    return this.aliases;
  }

  public void setAliases(String aliases) {
    this.aliases = aliases;
  }

  public String getDescription() {
    return this.description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public Set<Hero> getHeroes() {
    return heroes;
  }

  public void setHeroes(Set<Hero> heroes) {
    this.heroes = heroes;
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
    return Objects.equals(name, other.name);
  }

  @Override
  public String toString() {
    return "Power [aliases=" + aliases + ", description=" + description + ", name=" + name + ", score=" + score
        + ", tier=" + tier + "]";
  }

}


