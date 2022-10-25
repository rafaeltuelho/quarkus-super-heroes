package io.quarkus.sample.superheroes.fight.client;

import java.util.Objects;

import org.eclipse.microprofile.openapi.annotations.media.Schema;

/**
 * POJO representing a Power associated with a Character
 */
@Schema(description = "A super power associated with a Character")
public class Power {
  private String name;
  private String tier;
  private int score = 0;
  private String aliases;
  private String description;

  public Power(String name, String tier, int score, String aliases, String description) {
    this.name = name;
    this.tier = tier;
    this.score = score;
    this.aliases = aliases;
    this.description = description;
  }

  public Power() {
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getTier() {
    return tier;
  }

  public void setTier(String tier) {
    this.tier = tier;
  }

  public int getScore() {
    return score;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public String getAliases() {
    return aliases;
  }

  public void setAliases(String aliases) {
    this.aliases = aliases;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  @Override
  public int hashCode() {
    return Objects.hash(name);
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (!(obj instanceof Power))
      return false;
    Power other = (Power) obj;
    return Objects.equals(name, other.name);
  }

  @Override
  public String toString() {
    return "Power [name=" + name + ", tier=" + tier + ", score=" + score + ", aliases=" + aliases + ", description="
        + description + "]";
  }

}
