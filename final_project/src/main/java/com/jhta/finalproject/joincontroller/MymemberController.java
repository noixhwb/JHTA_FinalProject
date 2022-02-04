package com.jhta.finalproject.joincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MymemberController {
	@GetMapping("/member/mymember")
	public String joinForm() {
		System.out.println("컨트롤러작동중");
		
		return "member/mymember";
	}
}
