package com.jhta.finalproject.jobcontroller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.service.JobService;


@Controller
public class JobList {
	@Autowired private ServletContext sc;
	@Autowired private JobService service;
	
	@RequestMapping("/job/list")
	public String list(Model model) {
		List<JobVo> list = service.list();
		model.addAttribute("list",list);
		return "job/jobList";
	}
}
