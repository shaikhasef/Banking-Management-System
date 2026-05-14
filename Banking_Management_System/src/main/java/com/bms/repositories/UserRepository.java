package com.bms.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bms.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

	public User findBynameAndPass(String name,String pass);
	public List<String> findAllNames();
}
