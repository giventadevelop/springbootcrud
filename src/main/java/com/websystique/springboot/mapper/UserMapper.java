package com.websystique.springboot.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

import com.websystique.springboot.dto.DogBreedDTO;
import com.websystique.springboot.dto.UserDTO;
import com.websystique.springboot.model.DogBreed;
import com.websystique.springboot.model.User;

/**
 * Mapper for the entity DogBreed and its DTO DogBreedDTO.
 */
@Component
@Mapper(componentModel = "spring", uses = {})
public interface UserMapper {

    UserDTO UserToUserDTO(User user);

    List<UserDTO> usersToUserDTOs(List<User> users);

    User userDTOToUser(UserDTO userDTO);

    List<User> userDTOsToUsers(List<UserDTO> userDTOs);
    /**
     * generating the fromId for all mappers if the databaseType is sql, as the class has relationship to it might need it, instead of
     * creating a new attribute to know if the entity has any relationship from some other entity
     *
     * @param id id of the entity
     * @return the entity instance
     */
     
    default User userFromId(Integer id) {
        if (id == null) {
            return null;
        }
        User user = new User();
        user.setId(id);
        return user;
    }
    

}
