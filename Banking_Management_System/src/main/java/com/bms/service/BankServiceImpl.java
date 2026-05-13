package com.bms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bms.repositories.TransactionRepository;
import com.bms.repositories.UserRepository;

@Service
public class BankServiceImpl implements BankService{
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private TransactionRepository tRepo;

}
