package com.jhta.finalproject.jobcontroller;

import java.sql.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jobvo.CareerVo;
import com.jhta.finalproject.jobvo.DutyVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.jobvo.ZoneVo;
import com.jhta.finalproject.service.CareerService;
import com.jhta.finalproject.service.DutyService;
import com.jhta.finalproject.service.JobService;
import com.jhta.finalproject.service.ZoneService;

@Controller
public class JobDetail {
	@Autowired private JobService Jservice;
	@Autowired private ZoneService Zservice;
	@Autowired private DutyService Dservice;
	@Autowired private CareerService Cservice;
	
	@GetMapping("/job/detail")
	public String detail(int j_num, Model model) {
		JobVo jv = Jservice.selectOne(j_num);
		ZoneVo zv = Zservice.selectOne(j_num);
		DutyVo dv = Dservice.selectOne(j_num);
		CareerVo cv = Cservice.selectOne(j_num);
		int n=Jservice.addHit(j_num);
		
		model.addAttribute("jv",jv);
		model.addAttribute("zv",zv);
		model.addAttribute("dv",dv);
		model.addAttribute("cv",cv);
		
		return "job/jobDetail";
	}
	
	@GetMapping(value="/job/eventSelect",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody JobVo select(int j_num, Model model) {
		JobVo jv = Jservice.selectOne(j_num);
		return jv;
	}
	
//	@GetMapping("/job/eventDetail")
//	public String eventDetail(Date j_eventDate, Model model) {
//		JobVo eventModal = Jservice.selectEvent(j_eventDate);
//		int n=Jservice.addHit(eventModal.getJ_num());
		
//		model.addAttribute("eventModal",eventModal);
		
//		return "job/jobDetail";
//	}
}
