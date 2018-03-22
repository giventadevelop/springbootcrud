package com.websystique.springboot.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.websystique.springboot.dto.DogUserDogDTO;
import com.websystique.springboot.dto.GroupByDogBreedDTO;
import com.websystique.springboot.model.Dog;
import com.websystique.springboot.model.DogBreed;

/**
 * Spring Data JPA repository for the Dog entity.
 */
@Repository
@SuppressWarnings("unused")
public interface DogBreedRepository extends JpaRepository<DogBreed,Long> {
	

}
