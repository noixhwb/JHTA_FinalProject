package com.jhta.finalproject.dealcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DealManagementController {
	@GetMapping("/deal/management")
	public String move() {
		return "/deal/dealmanagement";
	}
}
