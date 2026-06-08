package com.bms.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.bms.entities.Transaction;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Integer>{
	

	    @Query("""
	        SELECT t
	        FROM Transaction t
	        WHERE (t.senderAccount = :senderId AND t.receiverAccount = :receiverId)
	           OR (t.senderAccount = :receiverId AND t.receiverAccount = :senderId)
	        ORDER BY t.ldate, t.ltime
	    """)
	    List<Transaction> getTransaction(
	            @Param("senderId") int senderId,
	            @Param("receiverId") int receiverId);
	    
	    
	    @Query("""
	            select t
	            from Transaction t
	            where t.senderAccount=:id
	            or t.receiverAccount=:id
	            order by t.ldate desc,t.ltime desc
	            """)
	    List<Transaction> getAllTransaction(@Param("id") int id);

}
