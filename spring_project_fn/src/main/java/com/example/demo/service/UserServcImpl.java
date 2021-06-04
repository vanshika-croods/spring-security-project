package com.example.demo.service;

import java.util.HashSet;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.model.User;
import com.example.demo.repo.RoleRepo;
import com.example.demo.repo.UserRepo;

@Service

public class UserServcImpl implements UserServic {

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private RoleRepo roleRepository;
	
//	@Autowired
//    private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userRepo.findAll();
	}
	
		
	@Override
	public User findById(long id) {
		// TODO Auto-generated method stub
		return userRepo.findById(id).orElse(null);
	}

	@Override
	public User findByRole(long role_id) {
		// TODO Auto-generated method stub
		return userRepo.findByRoleId(role_id);
	}

	@Override
	public User getByUserName(String username) {
		// TODO Auto-generated method stub
		return userRepo.findByUserName(username);
	}

	@Override
	public User insertAtUser(User user) {
//		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
//        user.setRoles(new HashSet<>(roleRepository.findAll()));
        return userRepo.save(user);
	}

	@Override
	public void deleteById(long id) {
		userRepo.deleteById(id);
	}
	
//	@Bean
//	public PasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}

}
