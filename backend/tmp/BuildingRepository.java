package de.fhbingen.bin.hungrig.data.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.fhbingen.bin.hungrig.data.Building;

public interface BuildingRepository extends CrudRepository<Building, Long>{

	List<Building> findAll();
	
	List<Building> findByName(final String name);
	
	Building findByBuildingId(final long id);
	
	/**
	 * Clients
	 */
	List<Building> findBySeqGreaterThan(final long seq);
}
