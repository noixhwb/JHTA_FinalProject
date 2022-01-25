package com.jhta.finalproject.timetablecontroller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TableController {
	@Autowired private ServletContext sc;

	@GetMapping("/timetable/table")
	public String tableForm() {
		sc.setAttribute("cp", sc.getContextPath());
		return "timetable/table";
	}

	
	
}
