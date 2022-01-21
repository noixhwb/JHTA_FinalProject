package com.jhta.finalproject.jobcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.service.JobService;
import com.jhta.finalproject.vo.JobVo;

@Controller
@RequestMapping("/job")
public class JobInsert {
	@Autowired private JobService service;
	
	@GetMapping("/insertForm")
	public String insertForm() {
		return "job/insertForm";
	}
	
	@PostMapping("/insert")
	public String insert(JobVo vo,Model model) {
		
		service.insert(vo);
		return "job/result";
	}
}
