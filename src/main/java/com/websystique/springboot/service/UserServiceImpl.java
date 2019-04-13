package com.websystique.springboot.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springboot.dto.DogDTO;
import com.websystique.springboot.dto.DogUserDogDTO;
import com.websystique.springboot.dto.UserDTO;
import com.websystique.springboot.mapper.UserMapper;

import com.websystique.springboot.model.User;
import com.websystique.springboot.model.UserFile;
import com.websystique.springboot.repositories.UserFilesRepository;
import com.websystique.springboot.repositories.UserRepository;
import com.websystique.springboot.security.service.EncryptionService;

@Service
// @Profile("springdatajpa")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserFilesRepository userFilesRepository;

	@Autowired
	UserMapper userMapper;

	@Autowired
	private EncryptionService encryptionService;

	@Override
	public List<?> listAll() {
		List<User> users = new ArrayList<>();
		userRepository.findAll().forEach(users::add); // fun with Java 8
		return users;
	}

	/**
	 * Get all the users.
	 * 
	 * @param pageable
	 *            the pagination information
	 * @return the list of entities
	 */
	@Override
	@Transactional(readOnly = true)
	public Page<UserDTO> findAll(Pageable pageable) {
		// log.debug("Request to get all Dogs");
		Page<User> result = userRepository.findAll(pageable);
		ArrayList<UserDTO> userDTOList = new ArrayList<UserDTO>();

		createUserDTO(result, userDTOList);

		/*
		 * result.forEach(dogUserDogDTO -> {
		 * 
		 * dogUserDogDTO.setLoggedInUserName(loggedInUserName); String
		 * encodeBase64 =
		 * Base64.encodeBase64String(dogUserDogDTO.getDogPicture()); // byte[]
		 * encodeBase64 = // Base64.encode(dogUserDogDTO.getDogPicture()); //
		 * String base64Encoded = new String(encodeBase64, "UTF-8");
		 * dogUserDogDTO.setBase64EncodedImg(encodeBase64);
		 * 
		 * });
		 */

		// mav.addObject("userImage", base64Encoded );

		// List<Object[]> dogUserDogResult=
		// dogRepository.getDogUserDog(loggedInUserName);
		long currentTotal = pageable.getOffset() + pageable.getPageSize();
		currentTotal = result.getTotalElements();

		return new PageImpl<UserDTO>(userDTOList, pageable, currentTotal);

		/*
		 * if (result != null) { return result.map(user ->
		 * userMapper.UserToUserDTO(user)); } return null;
		 */

	}

	private void createUserDTO(Page<User> result, ArrayList<UserDTO> userDTOList) {
		for (User user : result) {
			UserDTO userDTO = new UserDTO();
			userDTO.setId(user.getId());
			userDTO.setFirstName(user.getFirstName());
			userDTO.setLastName(user.getLastName());
			userDTO.setUserName(user.getUserName());
			userDTO.setYearPassed(user.getYearPassed());
			userDTO.setRoles(null);
			userDTOList.add(userDTO);

		}
	}

	@Override
	public Page<UserDTO> findByFirstName(String firstName, Pageable pageable) {

		// Page<User> result =
		// userRepository.findByFirstNameLikeIgnoreCase(firstName,pageable);
		// List<User> result =
		// userRepository.findByFirstNameLike(firstName,pageable);
		// List<User> result =
		// userRepository.findByFirstNameStartingWith(firstName, pageable);
		Page<User> result = userRepository.findByFirstNameStartingWith(firstName, pageable);
		ArrayList<UserDTO> userDTOList = new ArrayList<UserDTO>();

		createUserDTO(result, userDTOList);

		/*
		 * result.forEach(dogUserDogDTO -> {
		 * 
		 * dogUserDogDTO.setLoggedInUserName(loggedInUserName); String
		 * encodeBase64 =
		 * Base64.encodeBase64String(dogUserDogDTO.getDogPicture()); // byte[]
		 * encodeBase64 = // Base64.encode(dogUserDogDTO.getDogPicture()); //
		 * String base64Encoded = new String(encodeBase64, "UTF-8");
		 * dogUserDogDTO.setBase64EncodedImg(encodeBase64);
		 * 
		 * });
		 */

		// mav.addObject("userImage", base64Encoded );

		// List<Object[]> dogUserDogResult=
		// dogRepository.getDogUserDog(loggedInUserName);
		// final int currentTotal = pageable.getOffset() +
		// pageable.getPageSize();
		long currentTotal = result.getTotalElements();
		return new PageImpl<UserDTO>(userDTOList, pageable, currentTotal);
	}

	@Override
	public Page<UserDTO> findByLastName(String lastName, Pageable pageable) {
		Page<User> result = userRepository.findByLastName(lastName, pageable);
		ArrayList<UserDTO> userDTOList = new ArrayList<UserDTO>();

		createUserDTO(result, userDTOList);

		/*
		 * result.forEach(dogUserDogDTO -> {
		 * 
		 * dogUserDogDTO.setLoggedInUserName(loggedInUserName); String
		 * encodeBase64 =
		 * Base64.encodeBase64String(dogUserDogDTO.getDogPicture()); // byte[]
		 * encodeBase64 = // Base64.encode(dogUserDogDTO.getDogPicture()); //
		 * String base64Encoded = new String(encodeBase64, "UTF-8");
		 * dogUserDogDTO.setBase64EncodedImg(encodeBase64);
		 * 
		 * });
		 */

		// mav.addObject("userImage", base64Encoded );

		// List<Object[]> dogUserDogResult=
		// dogRepository.getDogUserDog(loggedInUserName);
		final int currentTotal = pageable.getOffset() + pageable.getPageSize();
		return new PageImpl<UserDTO>(userDTOList, pageable, currentTotal);
	}

	@Override
	public Page<UserDTO> findByYearPassed(String yearPassed, Pageable pageable) {
		Page<User> result = userRepository.findByYearPassed(yearPassed, pageable);
		ArrayList<UserDTO> userDTOList = new ArrayList<UserDTO>();

		createUserDTO(result, userDTOList);

		/*
		 * result.forEach(dogUserDogDTO -> {
		 * 
		 * dogUserDogDTO.setLoggedInUserName(loggedInUserName); String
		 * encodeBase64 =
		 * Base64.encodeBase64String(dogUserDogDTO.getDogPicture()); // byte[]
		 * encodeBase64 = // Base64.encode(dogUserDogDTO.getDogPicture()); //
		 * String base64Encoded = new String(encodeBase64, "UTF-8");
		 * dogUserDogDTO.setBase64EncodedImg(encodeBase64);
		 * 
		 * });
		 */

		// mav.addObject("userImage", base64Encoded );

		// List<Object[]> dogUserDogResult=
		// dogRepository.getDogUserDog(loggedInUserName);
		final int currentTotal = pageable.getOffset() + pageable.getPageSize();
		return new PageImpl<UserDTO>(userDTOList, pageable, currentTotal);
	}

	@Override
	public User getById(Integer id) {
		return userRepository.findOne(id);
	}

	@Override
	public User saveOrUpdate(User domainObject) {
		if (domainObject.getPassword() != null) {
			// domainObject.setEncryptedPassword(encryptionService.encryptString(domainObject.getPassword()));
			domainObject.setPassword(encryptionService.encryptString(domainObject.getPassword()));
		}
		return userRepository.save(domainObject);
	}

	@Override
	@Transactional
	public void delete(Integer id) {
		userRepository.delete(id);
	}

	@Override
	public User findByUserName(String userName) {
		return userRepository.findByUserName(userName);
	}

	@Override
	public UserFile saveOrUpdateUserFile(UserFile userFile) {
		return userFilesRepository.save(userFile);
	}

	public UserFilesRepository getUserFilesRepository() {
		return userFilesRepository;
	}

	public void setUserFilesRepository(UserFilesRepository userFilesRepository) {
		this.userFilesRepository = userFilesRepository;
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public UserRepository getUserRepository() {
		return userRepository;
	}

	public EncryptionService getEncryptionService() {
		return encryptionService;
	}

}
