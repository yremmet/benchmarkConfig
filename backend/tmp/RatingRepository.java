package de.fhbingen.bin.hungrig.data.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import de.fhbingen.bin.hungrig.data.Rating;

public interface RatingRepository extends CrudRepository<Rating, Long>{

	List<Rating> findAll();
	
	Rating findByratingId(long ratingId);
	
	@Query("SELECT ra FROM Rating ra " + 
	       "JOIN ra.dish di " + 
		   "JOIN di.building b " +
	       "WHERE b.buildingId IN (:buildings) AND ra.seq > :seq"
		  )
	List<Rating> findByBuildingIdsAndSeq(
			@Param("buildings") List<Long> buildings,
			@Param("seq") long seq);
	
	@Query("SELECT ra FROM Rating ra " + 
		   "JOIN ra.dish di " + 
		   "JOIN di.building b " +
		   "WHERE b.buildingId = :buildingId AND ra.seq > :seq"
	      )
	List<Rating> findByBuildingIdAndSeqGreaterThan(
			@Param("buildingId") long buildingId,
			@Param("seq") long seq);
}
