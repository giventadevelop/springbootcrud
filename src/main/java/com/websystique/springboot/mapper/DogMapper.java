package com.websystique.springboot.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import com.websystique.springboot.dto.DogDTO;
import com.websystique.springboot.model.Dog;

/**
 * Mapper for the entity Dog and its DTO DogDTO.
 */
@Component("dogMapper")
@Mapper(componentModel = "spring", uses = {DogBreedMapper.class, })
public interface DogMapper {

    @Mapping(source = "dogbreed.id", target = "dogbreedId")
    DogDTO dogToDogDTO(Dog dog);

    List<DogDTO> dogsToDogDTOs(List<Dog> dogs);

    @Mapping(source = "dogbreedId", target = "dogbreed")
    Dog dogDTOToDog(DogDTO dogDTO);

    List<Dog> dogDTOsToDogs(List<DogDTO> dogDTOs);
    /**
     * generating the fromId for all mappers if the databaseType is sql, as the class has relationship to it might need it, instead of
     * creating a new attribute to know if the entity has any relationship from some other entity
     *
     * @param id id of the entity
     * @return the entity instance
     */
     
    default Dog dogFromId(Long id) {
        if (id == null) {
            return null;
        }
        Dog dog = new Dog();
        dog.setId(id);
        return dog;
    } 
    

}
