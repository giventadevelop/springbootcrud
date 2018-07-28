package com.websystique.springboot.security.service;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;

public class tst {
	
	@Autowired
	static EncryptionService encryptionService;

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EncryptionServiceImpl  encryptionServiceImpl=new EncryptionServiceImpl() ;
		StrongPasswordEncryptor strongEncryptor=new StrongPasswordEncryptor() ;
		System.out.println(strongEncryptor.encryptPassword("user")); 
		
		System.out.println(strongEncryptor.encryptPassword("admin")); 
		
		System.out.println(strongEncryptor.checkPassword("user", "we7RkuoMXJDqPYS42yTfty+bWwbffIh8pw27il1urNzRRBBIOHEZJIXhpiziSVm3"));

	}

}
