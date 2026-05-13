package com.bms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BankController {
	@GetMapping("/")
	public String showhome() {
		return "home";
		
	}

}
