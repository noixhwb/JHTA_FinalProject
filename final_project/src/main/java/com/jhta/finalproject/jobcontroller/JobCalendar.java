package com.jhta.finalproject.jobcontroller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jobvo.JobVo;
import com.util.PageUtil;

import data.mybatis.mapper.JobMapper;

@Controller
public class JobCalendar {
	@Autowired private JobMapper Jservice;
	
	@GetMapping("/job/cal")
	public String cal(HttpServletRequest request) {
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", 1);
			map.put("endRow", 5);
			
			List<JobVo> list=Jservice.list(map);
			request.setAttribute("calendarList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "job/jobCalendar";
	}
	
/*	@GetMapping(value="/job/calan", produces={MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody List<JobVo> calendar(Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", 1);
		map.put("endRow", 5);
		
		List<JobVo> list=Jservice.list(map);
		return list;
	}*/
}
