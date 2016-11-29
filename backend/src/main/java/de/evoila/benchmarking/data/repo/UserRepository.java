package de.evoila.benchmarking.data.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import de.evoila.benchmarking.data.User;

@RepositoryRestResource(collectionResourceRel = "users", path = "users")
public interface UserRepository extends CrudRepository<User, Long> {
	
	User findOneByUserId(final long userId);
	
	User findOneByEmail(final String email);
	
}
