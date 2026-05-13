package com.bms.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "bsm_User")
public class User {
	 @Id
	 @SequenceGenerator(
	            name = "my_seq",
	            sequenceName = "student_seq",
	            initialValue = 100,
	            allocationSize = 1
	    )

	    @GeneratedValue(
	            strategy = GenerationType.SEQUENCE,
	            generator = "my_seq"
	    )
	    private int id;

	    @Lob
	    private byte[] image;
	    private String name;
	    private String pass;
	    private double balance;
	    private  String pin;


}
