package io.quarkus.sample.superheroes.villain.mapping;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

import io.quarkus.sample.superheroes.villain.Villain;

/**
 * Mapper to map all fields on an input {@link Villain} onto a target {@link Villain}.
 */
@Mapper(componentModel = "cdi", uses = { PowerUpdateMapper.class } )
public interface VillainFullUpdateMapper {
	/**
	 * Maps all fields except <code>id</code> from {@code input} onto {@code target}.
	 * @param input The input {@link Villain}
	 * @param target The target {@link Villain}
	 */
	@Mapping(target = "id", ignore = true)
	void mapFullUpdate(Villain input, @MappingTarget Villain target);
}
