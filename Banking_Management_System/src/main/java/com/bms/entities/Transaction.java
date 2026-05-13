package com.bms.entities;

import java.time.LocalDate;
import java.time.LocalTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "bsm_transaction")
public class Transaction {
	 @Id
	 @SequenceGenerator(
	            name = "id_seq",
	            sequenceName = "trans_seq",
	            initialValue = 140345,
	            allocationSize = 1
	    )

	    @GeneratedValue(
	            strategy = GenerationType.SEQUENCE,
	            generator = "id_seq"
	    )
	    private int tid;
	 private int senderAccount;
	 private int receiverAccount;
	    private double amount;
	    private String action;
	    private LocalDate ldate;
	    private LocalTime ltime;
	    


}
