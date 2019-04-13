package com.websystique.springboot.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.websystique.springboot.model.UserFile;
@Repository
public interface UserFilesRepository extends JpaRepository<UserFile,Integer>{

	//List<User> findByFirstNameLike(String firstName);
	//List<User> findByFirstNameStartingWith(String firstName);
	//Page<UserFile> findByUserId(int userId, Pageable page);
	
	
		
}
