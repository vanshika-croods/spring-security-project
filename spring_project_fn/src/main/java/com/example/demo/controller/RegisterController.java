package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.service.UserServic;

import lombok.extern.java.Log;
@Log
@Controller
public class RegisterController {

	@Autowired
	private UserServic userService;

	@Autowired
	BCryptPasswordEncoder  bCryptPasswordEncoder;

	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("userForm",new User());
		return "register";
	}
	
	
	
}
