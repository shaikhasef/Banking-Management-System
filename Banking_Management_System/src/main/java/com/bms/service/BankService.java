package com.bms.service;

import java.util.List;

import com.bms.entities.User;

public interface BankService {
	public String addUser(User u);
	public User login(String name,String pass);
	public User findById(int id);
	public List<String> getNames();
	public User VerifyPin(String pin);
}
