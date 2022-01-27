package com.jhta.finalproject.joincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/login")
	public String login() {
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
	
	

	
