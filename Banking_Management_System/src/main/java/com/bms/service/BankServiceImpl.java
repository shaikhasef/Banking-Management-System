package com.bms.service;


import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bms.entities.Transaction;
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
		return userRepo.findAllName();
	}
	@Override
	public User VerifyPin(String pin) {
		return userRepo.findByPin(pin);
	}
	@Override
	public List<User> getAll() {
		return userRepo.findAll();
	}
	@Override
	public int transfer(int senderId, int reciverId, double amt) {
		Transaction t = new Transaction();

		t.setSenderAccount(senderId);
		t.setReceiverAccount(reciverId);
		t.setAmount(amt);
		t.setAction("TRANSFER");
		t.setLdate(LocalDate.now());
		t.setLtime(LocalTime.now());

		
		return tRepo.save(t).getTid();
	}
	@Override
	public List<Transaction> getTrnsaction(int senderId, int recieverId) {
		return tRepo.getTransaction(senderId, recieverId);
	}
	@Override
	public List<Transaction> getAllTrnsaction(int id) {
		return tRepo.getAllTransaction(id);
	}

}
