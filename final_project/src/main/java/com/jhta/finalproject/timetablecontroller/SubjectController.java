package com.jhta.finalproject.timetablecontroller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.service.SubjectRateService;
import com.jhta.finalproject.service.SubjectService;
import com.jhta.finalproject.timetablevo.SubjectRateVo;
import com.jhta.finalproject.timetablevo.SubjectVo;
import com.util.PageUtil;

@Controller
public class SubjectController {
	@Autowired private ServletContext sc;
	@Autowired private SubjectService service;
	@Autowired private SubjectRateService rateservice;

	//강의평가 페이지로 이동
	@GetMapping("/timetable/subject")
	public String tableSubject() {
		sc.setAttribute("cp", sc.getContextPath());
		return "timetable/subject";
	}

	//강의평가 페이지에서 키워드로 검색후 리스트 출력
	@GetMapping("/timetable/subjectList")
	public String subjectList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String keyword,
			Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		int totalRowCount = service.count(map);
		PageUtil pu = new PageUtil(pageNum, 5, 5, totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<SubjectVo> list = service.subjectList(map);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		return "timetable/subject";
	}
	
	//강의평가 페이지에서 강의평가리스트 출력
	@GetMapping(value="/timetable/rateList", produces={MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> rateList(
			@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			int s_num) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("s_num", s_num);
		
		int totalRowCount = rateservice.count(s_num);

		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<SubjectRateVo> list = rateservice.rateList(map);
		map.put("list", list);
		map.put("pu", pu);
		return map;
	}
	
}
