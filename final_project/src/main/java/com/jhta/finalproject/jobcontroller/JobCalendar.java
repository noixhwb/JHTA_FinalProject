package com.jhta.finalproject.jobcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JobCalendar {
	
	@GetMapping("/job/cal")
	public String calendar() {
		return "job/jobCalendar";
	}
}
