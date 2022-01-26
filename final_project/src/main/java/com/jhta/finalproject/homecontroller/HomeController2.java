package com.jhta.finalproject.homecontroller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.service.HomeService;
import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.DealVo;
import com.jhta.finalproject.vo.SubjectVo;
import com.util.PageUtil;

@Controller
public class HomeController2 {
	@Autowired ServletContext sc;
	@Autowired HomeService service;
	
	@RequestMapping("/home/home")
	public String home(Model model) {
		sc.setAttribute("cp",sc.getContextPath());
		
		List<CommunityVo> communitylist = service.communityList();
		/* List<CircleVo> circlelist = service.circleList(); */
		List<DealVo> deallist = service.dealList();
		List<JobVo> jobinfolist = service.jobinfoList();
		model.addAttribute("communitylist", communitylist);
		/* model.addAttribute("circlelist", circlelist); */
		model.addAttribute("deallist", deallist);
		model.addAttribute("jobinfolist", jobinfolist);
		return "home/home";
	}
	
}
