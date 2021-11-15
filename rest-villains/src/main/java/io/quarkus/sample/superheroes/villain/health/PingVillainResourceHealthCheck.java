package io.quarkus.sample.superheroes.villain.health;

import javax.inject.Inject;

import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.Liveness;

import io.quarkus.sample.superheroes.villain.rest.VillainResource;

@Liveness
public class PingVillainResourceHealthCheck implements HealthCheck {
	@Inject
	VillainResource villainResource;

	@Override
	public HealthCheckResponse call() {
		String response = this.villainResource.hello();

		return HealthCheckResponse.named("Ping Villain REST Endpoint")
			.withData("Response", response)
			.up()
			.build();
	}
}