package com.bms.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bms.entities.Transaction;
import com.bms.entities.User;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Integer>{

}
