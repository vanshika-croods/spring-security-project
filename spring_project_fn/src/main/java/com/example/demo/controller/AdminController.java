package com.example.demo.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.repo.UserRepo;
import com.example.demo.service.UserServic;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private UserServic userService;
	
	@GetMapping("index")
	public ModelAndView index() {
		return new ModelAndView("admin/index");
	}
	
	@GetMapping("/userdelete/{userId}/delete")
	public String deleteUser(@PathVariable("userId") int userId) {
		userService.deleteById(userId);
		return "redirect:/admin/index";
	}
	
	@ResponseBody
	@GetMapping("edituser/{userId}")
	public User editCustomer(@PathVariable long userId) {
		//ModelAndView view = new ModelAndView();
		//view.setViewName("viewSupport");
		User user = userService.findById(userId);
		user.setRoles(null);
		//view.addObject("viewSupport", listSuppoprt);
		return user;
	}
	
}
