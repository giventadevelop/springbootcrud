package com.websystique.springboot.service;

import java.util.List;

import com.websystique.springboot.model.AppUser;
import com.websystique.springboot.repositories.AppUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


 
@Service("userService")
@Transactional
public class AppUserServiceImpl implements AppUserService{

	@Autowired
	private AppUserRepository userRepository;

	public AppUser findById(Long id) {
		return userRepository.findOne(id);
	}

	public AppUser findByName(String name) {
		return userRepository.findByName(name);
	}

	public void saveUser(AppUser user) {
		userRepository.save(user);
	}

	public void updateUser(AppUser user){
		saveUser(user);
	}

	public void deleteUserById(Long id){
		userRepository.delete(id);
	}

	public void deleteAllUsers(){
		userRepository.deleteAll();
	}

	public List<AppUser> findAllUsers(){
		return userRepository.findAll();
	}

	public boolean isUserExist(AppUser user) {
		return findByName(user.getName()) != null;
	}

}
