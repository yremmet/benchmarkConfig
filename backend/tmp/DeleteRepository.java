package de.fhbingen.bin.hungrig.data.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.fhbingen.bin.hungrig.data.Delete;

public interface DeleteRepository extends CrudRepository<Delete, Long> {

	List<Delete> findBySeqGreaterThan(long seq);
	
}
