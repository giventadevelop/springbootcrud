package com.websystique.springboot.service;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.websystique.springboot.dto.UserDTO;
import com.websystique.springboot.model.User;

public interface UserService extends CRUDService<User> {

    User findByUserName(String userName); 
    
    Page<UserDTO> findAll(Pageable pageable);
    
    Page<UserDTO> findByFirstName(String firstName,Pageable pageable);
    
    Page<UserDTO> findByLastName(String lastName ,Pageable pageable);

}
