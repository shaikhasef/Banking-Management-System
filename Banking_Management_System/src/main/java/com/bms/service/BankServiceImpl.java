package com.bms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bms.entities.User;
import com.bms.repositories.TransactionRepository;
import com.bms.repositories.UserRepository;

@Service
public class BankServiceImpl implements BankService{
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private TransactionRepository tRepo;
	@Override
	public String addUser(User u) {
		User save = userRepo.save(u);
		return save.getName()+" Registered successfully";
	}
	@Override
	public User login(String name, String pass) {
		return userRepo.findBynameAndPass(name, pass);
	}
	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		return userRepo.findById(id).orElse(null);
	}
	@Override
	public List<String> getNames() {
		// TODO Auto-generated method stub
		return userRepo.findAllNames();
	}

}
