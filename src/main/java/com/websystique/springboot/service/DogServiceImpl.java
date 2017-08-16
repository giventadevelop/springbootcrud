package com.websystique.springboot.service;

import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springboot.dto.DogDTO;
import com.websystique.springboot.dto.DogUserDogDTO;
import com.websystique.springboot.dto.GroupByDogBreedDTO;
import com.websystique.springboot.mapper.DogMapper;
import com.websystique.springboot.model.Dog;
import com.websystique.springboot.repositories.DogRepository;

/**
 * Service Implementation for managing Dog.
 */
@Service("dogService")
@Transactional
public class DogServiceImpl implements DogService {

	private final Logger log = LoggerFactory.getLogger(DogServiceImpl.class);
	@Autowired
	DogMapper dogMapper;
	@Autowired
	DogRepository dogRepository;
	

	/**
	 * Save a dog.
	 *
	 * @param dogDTO
	 *            the entity to save
	 * @return the persisted entity
	 */
	@Override
	public DogDTO save(DogDTO dogDTO) {
		log.debug("Request to save Dog : {}", dogDTO);
		Dog dog = dogMapper.dogDTOToDog(dogDTO);
		dog = dogRepository.save(dog);
		DogDTO result = dogMapper.dogToDogDTO(dog);
		return result;
	}

	/**
	 * Get all the dogs.
	 * 
	 * @param pageable
	 *            the pagination information
	 * @return the list of entities
	 */
	@Override
	@Transactional(readOnly = true)
	public Page<DogDTO> findAll(Pageable pageable) {
		log.debug("Request to get all Dogs");
		Page<Dog> result = dogRepository.findAll(pageable);

		return result.map(dog -> dogMapper.dogToDogDTO(dog));
	}

	/**
	 * Get one dog by id.
	 *
	 * @param id
	 *            the id of the entity
	 * @return the entity
	 */
	@Override
	@Transactional(readOnly = true)
	public DogDTO findOne(Long id) {
		log.debug("Request to get Dog : {}", id);
		Dog dog = dogRepository.findOne(id);
		DogDTO dogDTO = dogMapper.dogToDogDTO(dog);
		return dogDTO;
	}

	/**
	 * Delete the dog by id.
	 *
	 * @param id
	 *            the id of the entity
	 */
	@Override
	public void delete(Long id) {
		log.debug("Request to delete Dog : {}", id);
		dogRepository.delete(id);
	}

	/**
	 * Get all Dogs GROUP BY breed.
	 * 
	 * @param pageable
	 *            the pagination information
	 * @return the list of entities
	 */
	@SuppressWarnings("unchecked")
	public Page<GroupByDogBreedDTO> getAllDogsBreedsGroupBy(Pageable pageable) {
		log.debug("Request to get all Dogs Group By Dog Breed");
		List<GroupByDogBreedDTO> groupByDogBreedResult = dogRepository.getGroupByDogBreed();
		final int currentTotal = pageable.getOffset() + pageable.getPageSize();
		return new PageImpl(groupByDogBreedResult, pageable, currentTotal);

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Page<DogUserDogDTO> getDogUserDog(Pageable pageable, String loggedInUserName) {
		log.debug(" Get all Dogs with votes included at user_dog table.");
		//List<DogUserDogDTO> dogUserDogResult = dogRepository.getDogUserDog();
		List<DogUserDogDTO> dogUserDogResult = null;
		dogUserDogResult.forEach(dogUserDogDTO ->{
		
		dogUserDogDTO.setLoggedInUserName(loggedInUserName);
		String encodeBase64 = Base64.encodeBase64String(dogUserDogDTO.getDogPicture());
		//byte[] encodeBase64 = Base64.encode(dogUserDogDTO.getDogPicture());
	   // String base64Encoded = new String(encodeBase64, "UTF-8");
		dogUserDogDTO.setBase64EncodedImg(encodeBase64);
			
		});
		
		 
		
	    //mav.addObject("userImage", base64Encoded );
		
		 //List<Object[]> dogUserDogResult= dogRepository.getDogUserDog(loggedInUserName); 
		final int currentTotal = pageable.getOffset() + pageable.getPageSize();
		return new PageImpl<DogUserDogDTO>(dogUserDogResult, pageable, currentTotal);
		//return new PageImpl(dogUserDogResult, pageable, currentTotal);

	}
}
