package de.fhbingen.bin.hungrig.data.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import de.fhbingen.bin.hungrig.data.Sequence;

public interface SequenceRepository extends CrudRepository<Sequence, String> {
	
	@Query("SELECT s FROM Sequence s WHERE s.seq_name = 'sync'")
	Sequence getLast();
}
