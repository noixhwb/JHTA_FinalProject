package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyCircleController {
	//내 동아리 페이지로 이동
	//@Autowired private service;
	
	@GetMapping("/circle/MyCircle")
	public String mycircle() {
		return "circle/MyCircle";
	}
}
