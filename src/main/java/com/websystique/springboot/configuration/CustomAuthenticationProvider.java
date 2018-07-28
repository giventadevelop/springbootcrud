package com.websystique.springboot.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.websystique.springboot.security.service.EncryptionService;
import com.websystique.springboot.service.UserService;



@Component("customAuthenticationProvider")
//public class CustomAuthenticationProvider  extends DaoAuthenticationProvider  implements AuthenticationProvider  {
public class CustomAuthenticationProvider  implements AuthenticationProvider  {
	 @Autowired
	    private UserService userService;
	 @Autowired
	 private EncryptionService encryptionService;
	 @Autowired
	    private Converter<com.websystique.springboot.model.User, UserDetails> userUserDetailsConverter;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) authentication;
		UserDetails user = loadUserByUsername(token.getName());
		
		/*if(!user.getPassword().equalsIgnoreCase(encryptionService.encryptString(token.getCredentials().toString()))){
			throw new BadCredentialsException("The Password entered is not correct.");
		}*/
		
		if(user.getUsername()==null || user.getUsername().isEmpty() ){
			throw new BadCredentialsException("The user name doesn't exist.");
		}
		
		if(!encryptionService.checkPassword(token.getCredentials().toString(),user.getPassword())){
			throw new BadCredentialsException("The Password entered is not correct.");
		}
		
		
		
		return new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.equals(authentication);
	}
	
	 public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	        return userUserDetailsConverter.convert(userService.findByUserName(username));
	    }

}
