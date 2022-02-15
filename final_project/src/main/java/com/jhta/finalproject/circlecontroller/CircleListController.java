package com.jhta.finalproject.circlecontroller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.circlevo.MyCircleListVo;
import com.jhta.finalproject.service.CircleService;

@Controller
public class CircleListController {
	@Autowired private CircleService service;
	
	//전체 동아리 페이지로 이동
	@GetMapping("/circle/CircleList")
	public String circlelist(String ci_category, Model model) {
		List<CircleVo> list = service.selectAll();
		
		
		model.addAttribute("list", list);
		
		System.out.println("전체 동아리 페이지로 이동");
		return "circle/CircleList";
	}
	
	//카테고리별 동아리 페이지로 이동
	@GetMapping("/circle/CircleCategory")
	public String circlecategory(String ci_category, Model model) {
		List<CircleVo> catlist = service.selectCat(ci_category);
		model.addAttribute("catlist", catlist);
		model.addAttribute("ci_category", ci_category);
		return "circle/CircleCategory";
	}
}
