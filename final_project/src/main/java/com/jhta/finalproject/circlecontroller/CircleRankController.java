package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CircleRankController {
	//
	
	@GetMapping("/circle/circlerank")
	public String circlerank() {
		return "circle/circlerank";
	}
}
