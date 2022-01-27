package com.jhta.finalproject.jobcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class JobCalendar {
	
	@GetMapping("/job/cal")
	public String calendar() {
		return "job/jobCalendar";
	}
	
	@PostMapping("job/cal")
	public String calendar1() {
		
		return "job/jobCalendar";
	}
}
