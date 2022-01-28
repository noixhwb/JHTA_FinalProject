package com.jhta.finalproject.circlecontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.service.CircleService;

@Controller
public class CircleDetailController {
		//동아리 + 게시글 등록 페이지로 이동
		@Autowired private CircleService service;
		
		@GetMapping("/circle/CircleDetail")
		public String circledetail(int ci_num, Model model) {
			CircleVo sel = service.select(ci_num);
			model.addAttribute("sel", sel);
			return "circle/CircleDetail";
		}
}
