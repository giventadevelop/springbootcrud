package com.websystique.springboot.dto;

import java.io.Serializable;
import javax.persistence.*;

import com.websystique.springboot.model.Role;

import java.util.List;


/**
 * The DTO class for the user model object.
 * 
 */

public class UserDTO implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;

	private int active;

	private String email;


	private String firstName;


	private String lastName;

	private String password;


	private String userName;

	private List<Role> roles;

	public UserDTO() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getActive() {
		return this.active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
 
}