package io.quarkus.sample.superheroes.villain.mapping;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

import io.quarkus.sample.superheroes.villain.Power;

/**
 * Mapper to map <code><strong>non-null</strong></code> fields on an input {@link Power} onto a target {@link Power}.
 */
@Mapper(componentModel = "cdi")
public interface PowerUpdateMapper {
	/**
	 * Maps all <code><strong>non-null</strong></code> fields from {@code input} onto {@code target}.
	 * @param input The input {@link Power}
	 * @param target The target {@link Power}
	 */
	@Mapping(target = "id", ignore = true)
	void mapPartialUpdate(Power input, @MappingTarget Power target);

}
