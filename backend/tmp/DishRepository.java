package de.fhbingen.bin.hungrig.data.repo;

import java.util.Collection;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.fhbingen.bin.hungrig.data.Dish;

public interface DishRepository extends CrudRepository<Dish, Long>{

	List<Dish> findAll();
	
	List<Dish> findBybuildingIdInAndSeqGreaterThan(Collection<Long> buildings, long seq);
	
	List<Dish> findByBuildingIdAndSeqGreaterThan(final long buildingId, final long buildingSeq);
	
	Dish findBydishId(long id);
	
	// Fetcher commands
	
	Dish findByTitleAndBuildingId(final String title, final long buildingId);
	
}
