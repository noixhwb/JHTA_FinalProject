package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyCircleController {
	//@Autowired private service;
	
	@GetMapping("/circle/mycircle")
	public String mycircle() {
		return "circle/mycircle";
	}
}
