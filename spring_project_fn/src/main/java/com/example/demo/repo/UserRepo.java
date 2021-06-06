package com.example.demo.repo;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.model.User;

@Repository
public interface UserRepo extends JpaRepository<User, Long>,DataTablesRepository<User, Long> {
//	@Modifying
//	@Transactional
	
	
	@Query(value="select * from tbl_role where role_id=?1",nativeQuery=true)
	User findByRoleId(long role_id);
	User findByUserName(String userName);
	
	@Query("update User u set u.status=?1 where u.userId=?1")
	@Modifying
	User updateUser(int status,long userId);
		
}
