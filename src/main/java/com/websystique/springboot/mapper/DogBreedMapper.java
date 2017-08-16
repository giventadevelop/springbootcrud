package com.websystique.springboot.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

import com.websystique.springboot.dto.DogBreedDTO;
import com.websystique.springboot.model.DogBreed;

/**
 * Mapper for the entity DogBreed and its DTO DogBreedDTO.
 */
@Component
@Mapper(componentModel = "spring", uses = {})
public interface DogBreedMapper {

    DogBreedDTO dogBreedToDogBreedDTO(DogBreed dogBreed);

    List<DogBreedDTO> dogBreedsToDogBreedDTOs(List<DogBreed> dogBreeds);

    DogBreed dogBreedDTOToDogBreed(DogBreedDTO dogBreedDTO);

    List<DogBreed> dogBreedDTOsToDogBreeds(List<DogBreedDTO> dogBreedDTOs);
    /**
     * generating the fromId for all mappers if the databaseType is sql, as the class has relationship to it might need it, instead of
     * creating a new attribute to know if the entity has any relationship from some other entity
     *
     * @param id id of the entity
     * @return the entity instance
     */
     
    default DogBreed dogBreedFromId(Long id) {
        if (id == null) {
            return null;
        }
        DogBreed dogBreed = new DogBreed();
        dogBreed.setId(id);
        return dogBreed;
    }
    

}
