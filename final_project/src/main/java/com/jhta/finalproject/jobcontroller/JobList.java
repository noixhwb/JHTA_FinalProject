package com.jhta.finalproject.jobcontroller;

import java.security.Principal;
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

import com.jhta.finalproject.jobvo.DutyVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.jobvo.MyJobVo;
import com.jhta.finalproject.service.DutyService;
import com.jhta.finalproject.service.JobService;
import com.jhta.finalproject.service.MyJobService;
import com.jhta.finalproject.vo.MemberVo;
import com.util.PageUtil;


@Controller
public class JobList {
	@Autowired private JobService Jservice;
	@Autowired private DutyService Dservice;
	@Autowired private MyJobService MJservice;
	
	
	@RequestMapping("/job/jobList")
	public String jobList(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
					String keyword, Model model, Principal principal) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		int totalRowCount = Jservice.getCount(map);
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow(); 
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		MemberVo uservo = Jservice.selectUser(principal.getName());
		int userNum = uservo.getM_num();
		List<MyJobVo> myBookMarkList = MJservice.myScrap(userNum);
		model.addAttribute("myBookMarkList",myBookMarkList);

		
		
		List<JobVo> list = Jservice.list(map);
		List<DutyVo> dutyList = Dservice.list();
		model.addAttribute("keyword", keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("list",list);
		model.addAttribute("dutyList",dutyList);
		return "job/jobListt";
	}
}
