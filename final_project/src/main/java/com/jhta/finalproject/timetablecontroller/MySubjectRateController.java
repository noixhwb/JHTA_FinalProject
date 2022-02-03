package com.jhta.finalproject.timetablecontroller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.service.SubjectRateService;
import com.jhta.finalproject.timetablevo.MySubjectRateVo;
import com.jhta.finalproject.timetablevo.SubjectRateVo;
import com.util.PageUtil;

@Controller
public class MySubjectRateController {
	@Autowired private ServletContext sc;
	@Autowired private SubjectRateService rateservice;

	@PostMapping(value="/timetable/myrateInsert", produces={MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> myrateInsert(SubjectRateVo vo) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		rateservice.insert(vo);
		try {
			map.put("result", true);
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", false);
		}
		return map;
	}
	
	@GetMapping("/timetable/mysubjectrate")
	public String mysubjectrate(
			@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			int m_num,Model model) {
		sc.setAttribute("cp", sc.getContextPath());
		HashMap<String,Object> map1=new HashMap<String, Object>();
		map1.put("m_num", m_num);
		
		int totalRowCount = rateservice.mycount(m_num);
		PageUtil pu1 = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu1.getStartRow();// 시작행번호
		int endRow = pu1.getEndRow();// 끝행번호
		map1.put("startRow", startRow);
		map1.put("endRow", endRow);
		List<MySubjectRateVo> list = rateservice.myrateList(map1);
		model.addAttribute("m_num", m_num);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu1);
		return "timetable/mysubjectrate";
	}
	
	@PostMapping(value="/timetable/myrateUpdate", produces={MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> myrateUpdate(SubjectRateVo vo) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		rateservice.update(vo);
		try {
			map.put("result", true);
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", false);
		}
		return map;
	}
	
	@GetMapping(value="/timetable/myrateDelete", produces={MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> myrateDelete(int sr_num) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		rateservice.delete(sr_num);
		try {
			map.put("result", true);
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", false);
		}
		return map;
	}
}
