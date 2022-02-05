package com.jhta.finalproject.timetablecontroller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.service.SubjectService;
import com.jhta.finalproject.timetablevo.SubjectVo;
import com.util.PageUtil;

@Controller
public class TableController {
	@Autowired private ServletContext sc;
	@Autowired private SubjectService service;

	@GetMapping("/timetable/table")
	public String subjectList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			Model model) {
		sc.setAttribute("cp", sc.getContextPath());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", "");
		
		int totalRowCount = service.count(map);
		PageUtil pu = new PageUtil(pageNum, 5, 5, totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<SubjectVo> list = service.subjectList(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		return "timetable/table";
	}
	
	
}
