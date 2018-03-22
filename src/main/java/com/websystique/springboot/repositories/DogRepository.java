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
//@Repository
@SuppressWarnings("unused")
public interface DogRepository extends JpaRepository<Dog,Long> {
	
	
	/* @Query(value = "select dg_breed.breed_name, count(dg_breed.breed_name) as dogbreed_count from dog dg "+ 
        "inner join dog_breed dg_breed on dg.dogbreed_id = dg_breed.id group by dg_breed.breed_name" , nativeQuery = true)
	    List<GroupByDogBreedDTO> getGroupByDogBreed();*/
	/*Below give the full package name for the DTO class e.g. new com.dogapp.service.dto.GroupByDogBreedDTO .
	  If you don’t do this, Spring Data JPA will throw an exception because it cannot locate the DTO class.*/
	 @Query("select new com.websystique.springboot.dto.GroupByDogBreedDTO(dgbreed.breedName, count(dgbreed.breedName)) from Dog dg "+ 
		        "INNER JOIN dg.dogbreed dgbreed  where dg.dogbreed = dgbreed.id GROUP BY dgbreed.breedName")
			    List<GroupByDogBreedDTO> getGroupByDogBreed();
	 
	/* @Query("select new DogUserDogDTO(dg.id, usrdg.username, dg.dogPicture) from Dog dg "+ 
		        "LEFT JOIN UserDog usrdg ON dg.id = usrdg.dog ")
			    List<DogUserDogDTO> getDogUserDog();*/
	
	

}
