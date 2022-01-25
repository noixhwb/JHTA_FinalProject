package com.jhta.finalproject.circlecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FormController {
		//예시 폼 페이지로 이동
		
		@GetMapping("/circle/FORM")
		public String circleFORM() {
			return "circle/FORM";
		}
}
