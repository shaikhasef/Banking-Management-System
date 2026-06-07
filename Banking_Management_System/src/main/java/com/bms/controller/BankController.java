package com.bms.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bms.entities.Transaction;
import com.bms.entities.User;
import com.bms.service.BankService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class BankController {
	@Autowired
	private BankService service;
	
	@GetMapping("/")
	public String showhome() {
		return "login";
		
	}
	@PostMapping("/login")
	public String login(@RequestParam("name") String name,
						@RequestParam("pass") String pass,
						HttpSession ses,
						HttpServletRequest req) {
		User user = service.login(name, pass);
		if(user!=null)
		ses.setAttribute("user", user);
		else {
			req.setAttribute("msg", "Invalid UserName or Password !");
			return "login";
		}
		return "home";
	}
	
	@GetMapping("/register")
	public String registerForm(Map<String, Object> map) {
		List<String> list = service.getNames();
		System.out.println(list);
		map.put("names", list);
		return "register";
	}
	@PostMapping("/register")
	public String register(
	        @ModelAttribute User user,
	        @RequestParam("file") MultipartFile image) throws IOException {
		user.setImage(image.getBytes());
		user.setBalance(2000d);
		service.addUser(user);
		return "redirect:/";

	}
	@GetMapping("pin")
	public String VerifyPin() {
		return "pin";
	}
	@PostMapping("verify-pin")
	public String showBanalnce(@ModelAttribute User user,HttpSession ses,HttpServletRequest req) {
		User u =(User) ses.getAttribute("user");
		if(u.getPin().equals(user.getPin())) {
			req.setAttribute("balance", u.getBalance());
		return "balance";
		}
		else {
			req.setAttribute("msg", "Invalid UserName or Password !");
			return "pin";
		}
	}
	@GetMapping("/image/{id}")
    @ResponseBody
    public byte[] getImage(@PathVariable int id) {

        return service.findById(id).getImage();
    }
	@GetMapping("transfer")
	public String searchUser(HttpServletRequest req) {
		List<User> users = service.getAll();
		req.setAttribute("users", users);
		return "search_for_transfer";
	}

	@GetMapping("transfer-user")
	public String login(@RequestParam("id") int id,HttpServletRequest req,HttpSession ses) {
		User u = service.findById(id);
		req.setAttribute("user", u);
		User sender = (User)ses.getAttribute("user");
		List<Transaction> tra = service.getTrnsaction(sender.getId(), id);
		req.setAttribute("chat", tra);
		return "chat";
	}
	@GetMapping("moneySent")
	public String transferVerfication(
	        @RequestParam("money") double money,
	        @RequestParam("Rid") int receiverId,
	        HttpServletRequest req) {

	    req.setAttribute("money", money);
	    req.setAttribute("receiverId", receiverId);

	    return "transfer_pin";
	}
	@PostMapping("verify-transfer-pin")
	@Transactional
	public String verifyTransferPin(
	        @RequestParam String pin,
	        @RequestParam double money,
	        @RequestParam int receiverId,
	        HttpSession ses,
	        HttpServletRequest req) {

	    User sender = (User) ses.getAttribute("user");

	    if (!sender.getPin().equals(pin)) {

	        req.setAttribute("msg", "Invalid PIN");
	        req.setAttribute("money", money);
	        req.setAttribute("receiverId", receiverId);

	        return "transfer_pin";
	    }

	    if (money > sender.getBalance()) {
	        return "insuficiantBalance";
	    }

	    sender.setBalance(sender.getBalance() - money);
	    service.addUser(sender);

	    User receiver = service.findById(receiverId);
	    receiver.setBalance(receiver.getBalance() + money);
	    service.addUser(receiver);

	    service.transfer(sender.getId(), receiverId, money);

	    ses.setAttribute("user", sender);

	    return "redirect:transfer-user?id=" + receiverId;
	}
}
