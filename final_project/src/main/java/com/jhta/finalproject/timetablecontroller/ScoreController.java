package com.jhta.finalproject.timetablecontroller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ScoreController {
	@Autowired private ServletContext sc;

	@GetMapping("/timetable/score")
	public String tableSubject() {
		sc.setAttribute("cp", sc.getContextPath());
		return "timetable/score";
	}
	
}
