package com.example.demo.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.User;
import com.example.demo.repo.UserRepo;
import com.example.demo.service.UserServic;
import com.example.demo.service.UserService;

@Controller
public class MainController {

	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private UserServic userSerc;
	
	@Autowired
	private UserService userService;
	@ResponseBody
	@RequestMapping(value = "/data/users", method = RequestMethod.POST)
	public DataTablesOutput<User> getUsers(@Valid DataTablesInput input) {
		
		DataTablesOutput<User> user = userRepo.findAll(input);
		user.getData().forEach(x->x.setRoles(null));
		return user;
	}
	
}
