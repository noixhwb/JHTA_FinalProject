package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CircleRankController {
	//동아리 랭킹 페이지로 이동
	//@Autowired private service;
	
	@GetMapping("/circle/CircleRank")
	public String circlerank() {
		return "circle/CircleRank";
	}
}
