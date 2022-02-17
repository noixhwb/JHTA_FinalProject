package com.jhta.finalproject.jobcontroller;



import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jobvo.CareerVo;
import com.jhta.finalproject.jobvo.DutyVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.jobvo.MyJobVo;
import com.jhta.finalproject.jobvo.ZoneVo;
import com.jhta.finalproject.service.CareerService;
import com.jhta.finalproject.service.DutyService;
import com.jhta.finalproject.service.JobService;
import com.jhta.finalproject.service.MyJobService;
import com.jhta.finalproject.service.ZoneService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class JobDetail {
	@Autowired private JobService Jservice;
	@Autowired private ZoneService Zservice;
	@Autowired private DutyService Dservice;
	@Autowired private CareerService Cservice;
	@Autowired private MyJobService MJservice;
	
	@GetMapping("/job/detail")
	public String detail(int j_num, Model model, Principal principal) {
		JobVo jv = Jservice.selectOne(j_num);
		ZoneVo zv = Zservice.selectOne(j_num);
		DutyVo dv = Dservice.selectOne(j_num);
		CareerVo cv = Cservice.selectOne(j_num);
		int n=Jservice.addHit(j_num);
		
		MemberVo uservo = Jservice.selectUser(principal.getName());
		int userNum = uservo.getM_num();
		List<MyJobVo> myBookMarkList = MJservice.myScrap(userNum);
		model.addAttribute("myBookMarkList",myBookMarkList);
		
		
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
