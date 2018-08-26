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
    
    
    @RequestMapping("/login_success")
    String loginsuccess(HttpServletRequest request,HttpServletResponse response){
    	
    	
        return "login_success";
    }
    
    @RequestMapping("register_user_form")
	String register(ModelMap modal) {
		modal.addAttribute("title","CRUD Example");
		return "register_user_form";
	}
    
    
    @RequestMapping("register_user_success")
   	String registerSuccess( HttpSession session,ModelMap modal) {
   		modal.addAttribute("title","CRUD Example");
   		//HttpSession session= httpServletRequest.getSession(false);
   		modal.addAttribute("user", session.getAttribute("user"));
   		//modal.setAttribute("user", session.getAttribute("user"));
   		return "register_user_success";
   	}
    
    
    @RequestMapping("partials_uigrid")
   	String partialsUiGrid( HttpSession session,ModelMap modal) {
   		modal.addAttribute("title","CRUD Example");
   		//HttpSession session= httpServletRequest.getSession(false);
   		modal.addAttribute("user", session.getAttribute("user"));
   		//modal.setAttribute("user", session.getAttribute("user"));
   		return "partials_uigrid";
   	}
    
    
    @RequestMapping("partials_usersgrid")
   	String partialsUsersGgrid( HttpSession session,ModelMap modal) {
   		modal.addAttribute("title","CRUD Example");
   		//HttpSession session= httpServletRequest.getSession(false);
   		modal.addAttribute("user", session.getAttribute("user"));
   		//modal.setAttribute("user", session.getAttribute("user"));
   		return "partials_usersgrid";
   	}
    
    
    @RequestMapping("partials_angmaterial_tiles")
   	String partialsAngMaterialTiles( HttpSession session,ModelMap modal) {
   		modal.addAttribute("title","CRUD Example");
   		//HttpSession session= httpServletRequest.getSession(false);
   		modal.addAttribute("user", session.getAttribute("user"));
   		//modal.setAttribute("user", session.getAttribute("user"));
   		return "partials_angmaterial_tiles";
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
