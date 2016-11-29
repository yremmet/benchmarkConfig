package de.fhbingen.bin.hungrig.data.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.fhbingen.bin.hungrig.data.Ingredient;

public interface IngredientRepository extends CrudRepository<Ingredient, Long>{

	List<Ingredient> findByKey(final String key);
	
	List<Ingredient> findBySeqGreaterThan(final long seq);
}
