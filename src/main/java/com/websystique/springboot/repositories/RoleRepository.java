package com.websystique.springboot.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.websystique.springboot.model.Role;
@Repository
public interface RoleRepository extends CrudRepository<Role, Integer>{
}
