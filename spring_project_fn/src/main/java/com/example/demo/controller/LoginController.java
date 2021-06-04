package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@GetMapping("/login")
	public ModelAndView login() {
		return new ModelAndView("login");
	}
	
	@PostMapping("registration")
	public ModelAndView registration() {
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping("/fail_login")
	public ModelAndView failLogin() {
		return new ModelAndView("403");
	}
}
