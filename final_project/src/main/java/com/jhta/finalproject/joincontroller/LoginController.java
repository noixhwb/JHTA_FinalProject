package com.jhta.finalproject.joincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@GetMapping("/login")
	public String finallogin() {
		System.out.println("dd");
		return "login";
		
	}
	@GetMapping("/logout")
	public String logout() {
		return "logout";
	}
}
//
//	@RequestMapping(value="finallogin")
//	public String page() throws Exception{
//		return "/finallogin";
//		
//	}
//}
	
	

	
