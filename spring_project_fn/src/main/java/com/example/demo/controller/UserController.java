package com.example.demo.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Role;
import com.example.demo.model.User;
import com.example.demo.repo.RoleRepo;
import com.example.demo.repo.UserRepo;
import com.example.demo.service.UserServic;
import com.example.demo.service.UserService;
import com.example.demo.utils.BaseMethod;

import lombok.extern.java.Log;
@Log
@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	private BaseMethod baseMethod;

	@Autowired
	private UserServic userService; 
	
	@Autowired
	BCryptPasswordEncoder  bCryptPasswordEncoder;
	
	@Autowired
	RoleRepo roleRepo;
	
	public static final long ROLE_ADMIN = 1;
	public static final long ROLE_USER = 2;
//	public static final long URID_BRANCH = 3;
//	public static final long URID_USER = 4;
	@GetMapping("index")
	public ModelAndView index(HttpSession session) 
	{
		Long userId=Long.parseLong(session.getAttribute("userId").toString());

		String username = baseMethod.getUser();
		User user = userService.findById(userId);//getByUserName(username);
		return new ModelAndView("user/index").addObject("userlist",user);
	}
	
	@GetMapping("/listUser/{id}") 
	 public ModelAndView listUser(@PathVariable long id) { 
		 User userdetails = userService.findById(id); 
		 return new  ModelAndView("redirect:/user/index").addObject("userdetails",userdetails); 
	}
	
	
	@PostMapping("/saveDetails")
	public ModelAndView saveDetails(@ModelAttribute User user1) {
//		String username = baseMethod.getUser();
		long id = user1.getUserId();
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		User user = userService.findById(user1.getUserId());
		
		String password = user1.getPassword();
		if(user!=null && password!=null) {
			//user update
			log.warning("user update method");
			System.out.println("updated..");
//			String password = user1.getPassword();
			System.out.println("Password:::"+password);
			if(password!=null) {
				String encodedPassword = passwordEncoder.encode(user1.getPassword());
				user.setPassword(encodedPassword);
			}
			
		}
		else {
			//new entry
			log.warning("user update method");
			user = new User();
			user.setUserName(user1.getUserName());
			String encodedPassword = passwordEncoder.encode(user1.getPassword());
		    user.setPassword(encodedPassword);
		    user.setUserType("STUDENT");
		    user.setStatus(1);
		    Role role = roleRepo.findByRoleId(ROLE_USER);
		    if(role!=null) {
		    	log.info("....role.....");
		    	Set<Role> roles = new HashSet<Role>();
			    //List<UserRoleVo> roles = new ArrayList<UserRoleVo>();
		        roles.add(role);
		        user.setRoles(roles);    
		    }
		    
		}
//		String password = user1.getPassword();
//		System.out.println("Password:::"+password);
//		if(password!=null) {
//			String encodedPassword = passwordEncoder.encode(user1.getPassword());
//			user.setPassword(encodedPassword);
//		}
//		
		user.setFirstName(user1.getFirstName());
		user.setLastName(user1.getLastName());
		
		User user2 = userService.insertAtUser(user);

		if(id!=0) {
			return new ModelAndView("user/index").addObject("userlist",user);

		}
		else {
			return new ModelAndView("redirect:/login");
		}
		
	}
	
}



	
