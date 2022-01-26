package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CircleDetailController {
	//동아리 + 게시글 등록 페이지로 이동
		//@Autowired private service;
		
		@GetMapping("/circle/CircleDetail")
		public String circledetail() {
			return "circle/CircleDetail";
		}
}
