package com.jhta.finalproject.jobcontroller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.service.AdminService;
import com.util.PageUtil;

@Controller
public class ConfirmJobList {
	
	@Autowired AdminService Aservice;
	
	// 채용공고 개시요청 리스트 가져오기
	@GetMapping("/admin/appliedJobList")
	public String appliedJobList (@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
			String keyword, Model model ) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		// 페이징 기능
		int totalRowCount = Aservice.getJobCount();
		PageUtil pu=new PageUtil(pageNum, 6, 5, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow(); 
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<JobVo> jobList = Aservice.appliedJobList(map);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("jobList", jobList);
		return "admin/appliedJobList";
	}
	
	// 승인 메소드
	@GetMapping(value="/admin/confirmJob", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> confirmJob(int j_num, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		try {
			Aservice.confirmJob(j_num);
			map.put("result", true);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", false);
		}
		return map;
	}
	
	// 거절 메소드
	@GetMapping(value="/admin/rejectJob", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody Model rejectJob(int j_num, Model model){
		try {
			Aservice.rejectJob(j_num);
			return model.addAttribute("result","true");
		}catch(Exception e) {
			e.printStackTrace();
			return model.addAttribute("result","false");
		}
		
	}
}
