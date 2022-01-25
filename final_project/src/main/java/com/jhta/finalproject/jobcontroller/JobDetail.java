package com.jhta.finalproject.jobcontroller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.service.CareerService;
import com.jhta.finalproject.service.DutyService;
import com.jhta.finalproject.service.JobService;
import com.jhta.finalproject.service.ZoneService;

@Controller
public class JobDetail {
	@Autowired private ServletContext sc;
	@Autowired private JobService Jservice;
	@Autowired private ZoneService Zservice;
	@Autowired private DutyService Dservice;
	@Autowired private CareerService Cservice;
	
	@GetMapping("/job/detail")
	public String detail(int j_num) {
		JobVo vo = Jservice.selectOne(j_num);
		return "job/jobDetail";
	}
}
