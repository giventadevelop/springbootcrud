package com.websystique.springboot.repositories;

import com.websystique.springboot.model.AppUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppUserRepository extends JpaRepository<AppUser, Long> {

	AppUser findByName(String name);

}
