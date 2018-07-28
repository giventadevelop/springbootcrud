package com.websystique.springboot.service;

 
import com.websystique.springboot.model.AppUser;

import java.util.List;

public interface AppUserService {
	
	AppUser findById(Long id);

	AppUser findByName(String name);

	void saveUser(AppUser user);

	void updateUser(AppUser user);

	void deleteUserById(Long id);

	void deleteAllUsers();

	List<AppUser> findAllUsers();

	boolean isUserExist(AppUser user);
}