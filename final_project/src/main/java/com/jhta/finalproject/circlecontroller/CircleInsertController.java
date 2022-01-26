package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CircleInsertController {
	//동아리 + 게시글 등록 페이지로 이동
	//@Autowired private service;
	
	@GetMapping("/circle/CircleInsert")
	public String circleinsert() {
		return "circle/CircleInsertForm";
	}
	
	@GetMapping("/circle/CircleInsertOk")
	public String circleinsertok() {
		return "circle/CircleInsertOk";
	}
}
