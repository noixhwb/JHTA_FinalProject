package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CircleListController {
	//
	
	@GetMapping("/circle/circlelist")
	public String circlelist() {
		return "circle/circlelist";
	}
}
