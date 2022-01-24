package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CircleUpdateController {
	//동아리 및 게시글 수정 페이지로 이동(insert폼과 동일)
	//@Autowired private service;
	
	@GetMapping("/circle/CircleUpdate")
	public String circlelist() {
		return "circle/CircleUpdateForm";
	}
}
