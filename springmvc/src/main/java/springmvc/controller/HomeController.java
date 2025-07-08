package springmvc.controller;
import springmvc.Dao.userDao;
import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.tools.javac.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import springmvc.Dao.userDao;
import springmvc.model.Transaction;
import springmvc.model.User;

@Controller
public class HomeController {
	
	
	@RequestMapping("/home")
	public String home(Model model) {
		System.out.println("hello this is home url");
//		model.addAttribute("name", "shaikh asef");
//		model.addAttribute("id", 112);
		return "index";
	}
	
	@RequestMapping("/about")
	public String about() {
		System.out.println("about page");
		return "about";
	}
	@RequestMapping("/regi")
	public String register() {
		System.out.println("register page");
		return "help";
	}
	 @GetMapping("/dashboard")
	    public String dashboardPage() {
	        return "dashboard";  // Make sure there is a dashboard.jsp file in WEB-INF/views
	    }
//	@RequestMapping("help")
//	public ModelAndView help() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("name", "pearl");
//		mav.addObject("rn",123);
//		LocalDate now = LocalDate.now();
//		mav.addObject("time", now);
//		ArrayList<Integer> list = new ArrayList<Integer>();
//		list.add(12);
//		list.add(23);
//		list.add(34);
//		list.add(45);
//		mav.addObject("marks", list);
//		mav.setViewName("help");
//		return mav;
	
	@PostMapping("/processForm")
	public String processForm(@RequestParam("asef") String username,
	                          @RequestParam("shaikh") String password, 
	                          HttpSession session,
	                          Model model) {
	    
	    String name = userDao.getUserName(username, password);
	    Double balance = userDao.getBalance(username, password);

	    if (name != null) {
	        session.setAttribute("loggedInUser", username);  // ✅ Set session attribute
	        model.addAttribute("name", name);
	        model.addAttribute("balance", balance != null ? balance : 0.0);
	        return "about";  // Redirect to dashboard/homepage
	    } else {
	        model.addAttribute("error", "Invalid Username or Password");
	        return "index";  // Redirect to login page
	    }
	}

	 @Autowired  // ✅ Inject userDao dependency
	    private userDao userDao;  

	    @RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	    public String registerUser(@RequestParam("name") String name, 
	    		                   @RequestParam("balance")Double balance,
	                               @RequestParam("username") String username, 
	                               @RequestParam("password") String password, 
	                               Model model) {  

	        // ✅ Create a new User object
	        User user = new User(name,balance, username, password);
	        user.setName(name);
	        user.setUsername(username);
	        user.setPassword(password);
	        user.setBalance(2000.0);  // Default balance

	        // ✅ Insert user into the database
	        int result = userDao.insert(user);

	        if (result > 0) {
	            model.addAttribute("message", "Registration Successful!");
	        } else {
	            model.addAttribute("message", "Registration Failed!");
	        }

	        return "index";  // Redirect to success page
	    }
	    
	    

	    @RequestMapping(value = "/showTransferPage", method = RequestMethod.GET)
	    public String showTransferPage() {
	        return "transfer"; // Renders transfer.jsp
	    }

	    // Handle Transfer Logic
	    @RequestMapping(value = "/transfer", method = RequestMethod.POST)
	    public String transferAmount(@RequestParam("password") String password,
	    		                     @RequestParam("receiverUsername") String receiverUsername,
	                                 @RequestParam("amount") double amount, HttpSession session,
	                                 Model model) {


	        // Check if user exists
	        User sender = userDao.getUserBypassword(password);
	        User receiver = userDao.getUserByUsername(receiverUsername);

	        if (sender == null || receiver == null) {
	            model.addAttribute("message", "Invalid sender or receiver username.");
	            return "transfer";
	        }

	        // Check balance
	        if (sender.getBalance() < amount) {
	            model.addAttribute("message", "Insufficient balance!");
	            return "transfer";
	        }

	        // Perform transaction
	        boolean success = userDao.transferAmount(password, receiverUsername, amount);

	        if (success) {
	        	
	            model.addAttribute("message", "Transfer Successful!");
	            List<Transaction> transactions = (List<Transaction>) userDao.getTransactionHistory(password, sender.getUsername());

	            // ✅ Add transactions to model and session
	            model.addAttribute("transactions", transactions);
	            session.setAttribute("transactions", transactions); 

	            return "transfer"; // Redirect to the JSP page
	            // Redirects to a success page
	        } else {
	            model.addAttribute("message", "Transfer Failed! Try Again.");
	            return "transfer";
	        }
	    }

		private void getTransactionHistory(User sender, User receiver) {
			// TODO Auto-generated method stub
			
		}
	 
	}

	

