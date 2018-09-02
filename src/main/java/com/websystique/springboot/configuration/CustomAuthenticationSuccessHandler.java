package com.websystique.springboot.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.websystique.springboot.repositories.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	//@Autowired
	UserRepository userRepository;
	
	@Override 
	public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {  
		//do some logic here if you want something to be done whenever         //the user successfully logs in. 
		HttpSession session = httpServletRequest.getSession();
		
		/*com.websystique.springboot.model.User authUser=userRepository.findByUserName(authentication.getPrincipal().toString());
		session.setAttribute("userId", authUser.getId());
		*///User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		//session.setAttribute("username", authUser.getUsername());    
		session.setAttribute("authorities", authentication.getAuthorities());   
		//set our response to OK status     
		httpServletResponse.setStatus(HttpServletResponse.SC_OK);    
		//since we have created our custom success handler, its up to us to where  
		//we will redirect the user after successfully login 
		httpServletResponse.sendRedirect("login_success"); 
		}
	
	
	@Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

}



