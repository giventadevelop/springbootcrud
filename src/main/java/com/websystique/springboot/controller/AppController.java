package com.websystique.springboot.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AppController {

	@RequestMapping("/")
	String home(ModelMap modal) {
		modal.addAttribute("title","CRUD Example");
		return "index";
	}
	
	@RequestMapping("homepage")
	String homePageTest(ModelMap modal) {
		modal.addAttribute("title","CRUD Example");
		return "homepage";
	}
	
	/*@RequestMapping("login")
	String loginPage(ModelMap modal,HttpServletRequest request,HttpServletResponse response) {
		modal.addAttribute("title","CRUD Example");
		//return "login";
		
		try {
			response.sendRedirect("login");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "login";
	}*/
	
	
	@RequestMapping("login")
	String loginForwardPage(ModelMap modal,HttpServletRequest request,HttpServletResponse response) {
		modal.addAttribute("title","CRUD Example");
		//return "login";
		
		/*try {
			response.sendRedirect("login");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		return "login";
	}
	
	@RequestMapping("/session")
    String session(HttpServletRequest request,HttpServletResponse response){
    	
    	HttpSession session= request.getSession(false);
    	Cookie[] cookies = request.getCookies();
    	 
        // Delete all the cookies
        if (cookies != null) {
     
            for (int i = 0; i < cookies.length; i++) {
     
                Cookie cookie = cookies[i];
               
               	System.out.println("cookie_getName_session "+cookie.getName());
               
                cookies[i].setValue(null);
                cookies[i].setMaxAge(0);
                response.addCookie(cookie);
               
            }
        }
    	
        SecurityContextHolder.clearContext();
        if(session != null) {
            session.invalidate();
        }
        return "session";
    }
    
    
    @RequestMapping("/loginsuccess")
    String loginsuccess(HttpServletRequest request,HttpServletResponse response){
    	
    	
        return "loginsuccess";
    }
    
    @RequestMapping("register")
	String register(ModelMap modal) {
		modal.addAttribute("title","CRUD Example");
		return "register";
	}
    
    
    @RequestMapping("/protectedpage")
    String protectedpage(HttpServletRequest request,HttpServletResponse response){
    	
    	
        return "protected_page";
    }
    
    @RequestMapping("/logout")
    String logout(HttpServletRequest request,HttpServletResponse response){
    	
    	HttpSession session= request.getSession(false);
    	Cookie[] cookies = request.getCookies();
    	 
        // Delete all the cookies
        if (cookies != null) {
     
            for (int i = 0; i < cookies.length; i++) {
     
                Cookie cookie = cookies[i];
               
               	System.out.println("cookie_getName_session "+cookie.getName());
               
                cookies[i].setValue(null);
                cookies[i].setMaxAge(0);
                response.addCookie(cookie);
               
            }
        }
    	
        SecurityContextHolder.clearContext();
        if(session != null) {
            session.invalidate();
        }
        return "logout";
    }
	

	@RequestMapping("/partials/{page}")
	String partialHandler(@PathVariable("page") final String page) {
		return page;
	}

}
