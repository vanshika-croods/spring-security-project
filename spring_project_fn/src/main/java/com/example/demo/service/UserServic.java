package com.example.demo.service;

import java.util.List;

import com.example.demo.model.User;

public interface UserServic {

	User insertAtUser(User user);
	
	User findById(long id);
	
	List<User> findAll();
	
	User findByRole(long role_id);
	
	User getByUserName(String username);
	
	void deleteById(long id);
	
	void updateOrder(int status, long userId);

}
