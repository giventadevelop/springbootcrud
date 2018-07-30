package com.websystique.springboot.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.PagedResourcesAssembler;
import org.springframework.hateoas.PagedResources;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.websystique.springboot.dto.DogDTO;
import com.websystique.springboot.dto.UserDTO;
import com.websystique.springboot.model.User;
import com.websystique.springboot.resource.assembler.UserResourceAssembler;
import com.websystique.springboot.service.UserService;
import com.websystique.springboot.util.CustomErrorType;
import com.websystique.springboot.util.PaginationUtil;

@RestController
@RequestMapping("/api")
public class RestApiController { 

	public static final Logger logger = LoggerFactory.getLogger(RestApiController.class);

	@Autowired
	UserService userService; //Service which will do all data retrieval/manipulation work
	
	@Autowired
	UserResourceAssembler userResourceAssembler;
	

	// -------------------Retrieve All Users---------------------------------------------
	
	
	/**
     * GET  /dogs : get all the dogs.
     * @param pageable the pagination information
     * @return the ResponseEntity with status 200 (OK) and the list of dogs in body
     */
    @SuppressWarnings("unchecked")
	@GetMapping("/user")
    //@Timed
    public PagedResources<UserDTO> getAllDogs(  @PageableDefault(page = 0, size = 10) Pageable pageable,PagedResourcesAssembler assembler) {
    	logger.debug("REST request to get a page of users");
       Page<UserDTO> page = userService.findAll(pageable);
       /* String loggedInUserName=SecurityContextHolder.getContext().getAuthentication().getName();
        Page<DogUserDogDTO> pageUserDog = dogService.getDogUserDog(pageable, loggedInUserName);*/
     //  HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/dogs");
      //  HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/dogs");
      // return new ResponseEntity<>(page.getContent(), headers, HttpStatus.OK);
       return assembler.toResource(page, userResourceAssembler);
        //return new ResponseEntity<List<DogDTO>>(page.getContent(), HttpStatus.OK);
        //return new ResponseEntity<>(pageUserDog.getContent(), headers, HttpStatus.OK);
    }

	/*@RequestMapping(value = "/user/", method = RequestMethod.GET)
	public ResponseEntity<List<User>> listAllUsers() {
		List<User> users = userService.findAll(pageable);
		if (users.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
			// You many decide to return HttpStatus.NOT_FOUND
		}
		return new ResponseEntity<List<User>>(users, HttpStatus.OK);
	}*/

	// -------------------Retrieve Single User------------------------------------------

	/*@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public ResponseEntity<?> getUser(@PathVariable("id") long id) {
		logger.info("Fetching User with id {}", id);
		User user = userService.findById(id);
		if (user == null) {
			logger.error("User with id {} not found.", id);
			return new ResponseEntity(new CustomErrorType("User with id " + id 
					+ " not found"), HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<User>(user, HttpStatus.OK);
	}*/

	// -------------------Create a User-------------------------------------------

	@RequestMapping(value = "/user/", method = RequestMethod.POST)
	public ResponseEntity<?> createUser(@RequestBody User user, UriComponentsBuilder ucBuilder) {
		logger.info("Creating User : {}", user);

		/*if (userService.isUserExist(user)) {
			logger.error("Unable to create. A User with name {} already exist", user.getName());
			return new ResponseEntity(new CustomErrorType("Unable to create. A User with name " + 
			user.getName() + " already exist."),HttpStatus.CONFLICT);
		}*/
		//userService.saveUser(user);
		user=userService.saveOrUpdate(user);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/api/user/{id}").buildAndExpand(user.getId()).toUri());
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}

	// ------------------- Update a User ------------------------------------------------

	/*@RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
	public ResponseEntity<?> updateUser(@PathVariable("id") long id, @RequestBody User user) {
		logger.info("Updating User with id {}", id);

		User currentUser = userService.findById(id);

		if (currentUser == null) {
			logger.error("Unable to update. User with id {} not found.", id);
			return new ResponseEntity(new CustomErrorType("Unable to upate. User with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}

		currentUser.setName(user.getName());
		currentUser.setAge(user.getAge());
		currentUser.setSalary(user.getSalary());

		userService.updateUser(currentUser);
		return new ResponseEntity<User>(currentUser, HttpStatus.OK);
	}*/

	// ------------------- Delete a User-----------------------------------------

	/*@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteUser(@PathVariable("id") long id) {
		logger.info("Fetching & Deleting User with id {}", id);

		User user = userService.findById(id);
		if (user == null) {
			logger.error("Unable to delete. User with id {} not found.", id);
			return new ResponseEntity(new CustomErrorType("Unable to delete. User with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}
		userService.deleteUserById(id);
		return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
	}*/

	// ------------------- Delete All Users-----------------------------

	/*@RequestMapping(value = "/user/", method = RequestMethod.DELETE)
	public ResponseEntity<User> deleteAllUsers() {
		logger.info("Deleting All Users");

		userService.deleteAllUsers();
		return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
	}
*/
}