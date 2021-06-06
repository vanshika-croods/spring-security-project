package com.example.demo.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.User;
import com.example.demo.repo.RoleRepo;
import com.example.demo.repo.UserRepo;

@Service

public class UserServcImpl implements UserServic {

	@PersistenceContext
	private EntityManager entityManager;

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

	@Override
	@Transactional
	public void updateOrder(int status, long userId) {
		CriteriaBuilder cb = this.entityManager.getCriteriaBuilder();
		CriteriaUpdate<User> update = cb.createCriteriaUpdate(User.class);
		Root e = update.from(User.class);
		update.set("status",status);
		update.where(cb.equal(e.get("userId"), userId));
		this.entityManager.createQuery(update).executeUpdate();
	}
}
