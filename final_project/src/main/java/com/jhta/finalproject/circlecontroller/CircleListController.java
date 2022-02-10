package com.jhta.finalproject.circlecontroller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.service.CircleService;

@Controller
public class CircleListController {
	//전체 동아리 페이지로 이동
	@Autowired private CircleService service;
	
	@GetMapping("/circle/CircleList")
	public String circlelist(Model model) {
		List<CircleVo> list = service.selectAll();
		model.addAttribute("list", list);
		
		System.out.println("전체 동아리 페이지로 이동");
		return "circle/CircleList";
	}
}
