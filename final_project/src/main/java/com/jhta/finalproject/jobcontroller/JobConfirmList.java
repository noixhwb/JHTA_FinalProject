package com.jhta.finalproject.jobcontroller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.service.AdminService;
import com.util.PageUtil;

@Controller
public class JobConfirmList {
	
	@Autowired AdminService Aservice;
	
	@GetMapping("/admin/appliedJobList")
	public String appliedJobList (@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
			String keyword, Model model ) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		// 페이징 기능
		int totalRowCount = Aservice.getCount(map);
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow(); 
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<JobVo> list = Aservice.appliedJobList(map);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("list",list);
		return "admin/appliedJobList";
	}
}
