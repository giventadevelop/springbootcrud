package com.websystique.springboot.repositories;

import org.springframework.data.repository.CrudRepository;

import com.websystique.springboot.model.Role;

public interface RoleRepository extends CrudRepository<Role, Integer>{
}
