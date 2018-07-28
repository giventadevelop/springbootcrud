package com.websystique.springboot.repositories;


import org.springframework.data.repository.CrudRepository;

import com.websystique.springboot.model.User;

public interface UserRepository extends CrudRepository<User, Integer>{
    User findByUserName(String userName);
}
