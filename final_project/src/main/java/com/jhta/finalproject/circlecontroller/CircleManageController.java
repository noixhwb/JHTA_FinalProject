package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CircleManageController {
	//동아리 및 게시글 관리 페이지로 이동
	//@Autowired private service;
	
	@GetMapping("/circle/CircleManage")
	public String circleinsert() {
		return "circle/CircleManage";
	}
}
