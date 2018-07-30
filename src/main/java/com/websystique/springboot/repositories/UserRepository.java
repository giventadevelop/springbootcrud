package com.websystique.springboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.websystique.springboot.model.Dog;
import com.websystique.springboot.model.User;

public interface UserRepository extends JpaRepository<User,Integer>{

	User findByUserName(String userName);
}
