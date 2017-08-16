package com.websystique.springboot.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.websystique.springboot.dto.DogDTO;
import com.websystique.springboot.dto.DogUserDogDTO;
import com.websystique.springboot.dto.GroupByDogBreedDTO;

/**
 * Service Interface for managing Dog.
 */
public interface DogService {

    /**
     * Save a dog.
     *
     * @param dogDTO the entity to save
     * @return the persisted entity
     */
    DogDTO save(DogDTO dogDTO);

    /**
     *  Get all the dogs.
     *  
     *  @param pageable the pagination information
     *  @return the list of entities
     */
    Page<DogDTO> findAll(Pageable pageable);

    /**
     *  Get the "id" dog.
     *
     *  @param id the id of the entity
     *  @return the entity
     */
    DogDTO findOne(Long id);

    /**
     *  Delete the "id" dog.
     *
     *  @param id the id of the entity
     */
    void delete(Long id);
    
    
    /**
     *  Get all Dogs GROUP BY breed.
     *  @param pageable the pagination information
     *  @return the list of GroupByDogBreedDTO entities
     */
    Page<GroupByDogBreedDTO> getAllDogsBreedsGroupBy(Pageable pageable);

    /**
     *  Get all Dogs with votes included at user_dog table.
     *  @param pageable the pagination information
     *  @param loggedInUserName the l
     *  @return the list of GroupByDogBreedDTO entities
     */
	Page<DogUserDogDTO> getDogUserDog(Pageable pageable,String loggedInUserName);
   
}
