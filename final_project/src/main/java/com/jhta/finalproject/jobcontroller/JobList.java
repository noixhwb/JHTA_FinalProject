package com.jhta.finalproject.jobcontroller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.service.JobService;
import com.util.PageUtil;


@Controller
public class JobList {
	@Autowired private ServletContext sc;
	@Autowired private JobService service;
	
	
	@RequestMapping("/job/jobList")
	public String jobList(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
					String keyword, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		int totalRowCount = service.getCount(map);
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow(); 
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<JobVo> list = service.list(map);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("list",list);
		return "job/jobListt";
	}
}
