package com.jhta.finalproject.jobcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyScrap {
	@GetMapping("/job/myScrap")
	public String scrapList() {
		return "job/myScrap";
	}
}
