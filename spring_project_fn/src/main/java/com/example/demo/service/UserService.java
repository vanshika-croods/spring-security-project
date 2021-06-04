package com.example.demo.service;

import java.util.HashSet;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.model.Role;
import com.example.demo.model.User;
import com.example.demo.repo.UserRepo;

@Service
@Transactional
public class UserService implements UserDetailsService{

	@Autowired
	private UserRepo userRepo;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		User user=userRepo.findByUserName(userName);
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();       
		System.out.println(user.getRoles().toString());
		for (Role role : user.getRoles())
		{
	            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
	    }

		return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(), grantedAuthorities);

	}

	
}
