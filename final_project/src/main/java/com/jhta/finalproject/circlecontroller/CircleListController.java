package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CircleListController {
	//전체 동아리 페이지로 이동
	//@Autowired private service;
	
	@GetMapping("/circle/CircleList")
	public String circlelist() {
		return "circle/CircleList";
	}
}
