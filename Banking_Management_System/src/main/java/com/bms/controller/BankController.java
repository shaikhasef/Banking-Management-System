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

import com.bms.entities.User;
import com.bms.service.BankService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
	@GetMapping("/image/{id}")
    @ResponseBody
    public byte[] getImage(@PathVariable int id) {

        return service.findById(id).getImage();
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

}
