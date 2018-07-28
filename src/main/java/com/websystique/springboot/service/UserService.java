package com.websystique.springboot.service;

import com.websystique.springboot.model.User;

public interface UserService extends CRUDService<User> {

    User findByUserName(String userName); 

}
