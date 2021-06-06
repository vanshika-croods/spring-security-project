package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.User;
import com.example.demo.repo.UserRepo;
import com.example.demo.service.UserServic;
import com.example.demo.service.UserService;

import lombok.extern.java.Log;
@Log
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
	public DataTablesOutput<User> getUsers(@Valid @RequestBody DataTablesInput input) 
	{
        Specification<User> specification = new Specification<User>() {
            private static final long serialVersionUID = 1L;
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicates = new ArrayList<Predicate>();
                predicates.add(criteriaBuilder.equal(root.get("userType"),"STUDENT" ));
               // predicates.add(criteriaBuilder.eq notEqual(root.get("userId"), 15));

                //query.orderBy(criteriaBuilder.desc(root.get("productId")));
                return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };


		DataTablesOutput<User> user = userRepo.findAll(input,null, specification);
		user.getData().forEach(x->x.setRoles(null));
		return user;
	}
	
}
