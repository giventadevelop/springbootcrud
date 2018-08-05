package com.websystique.springboot.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.websystique.springboot.model.User;

public interface UserRepository extends JpaRepository<User,Integer>{

	User findByUserName(String userName);
	
	//Page<User> findByFirstnameLikeIgnoreCase(String firstName, Pageable page);
	//List<User> findByFirstNameLike(String firstName, Pageable page);
	//List<User> findByFirstNameLike(String firstName);
	//List<User> findByFirstNameStartingWith(String firstName);
	Page<User> findByFirstNameStartingWith(String firstName, Pageable page);
	
	
	Page<User> findByLastName(String lastName, Pageable page);
}
