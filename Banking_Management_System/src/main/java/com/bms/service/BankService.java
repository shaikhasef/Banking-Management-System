package com.bms.service;

import java.util.List;

import com.bms.entities.Transaction;
import com.bms.entities.User;

public interface BankService {
	public String addUser(User u);
	public User login(String name,String pass);
	public User findById(int id);
	public List<String> getNames();
	public User VerifyPin(String pin);
	public List<User> getAll();
	public int transfer(int senderId,int reciverId,double amt);
	public List<Transaction> getTrnsaction(int senderId,int recieverId);
	public List<Transaction> getAllTrnsaction(int id);
	
}
