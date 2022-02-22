package com.jhta.finalproject.jobcontroller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.service.MemberService;
import com.util.PageUtil;

@Controller
public class MemberList {
	@Autowired private MemberService service;
	
	@GetMapping("/admin/memberList")
	public String showList(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
			String keyword, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		//페이징
		int totalRowCount = service.getCount(map);
		PageUtil pu=new PageUtil(pageNum, 10, 5, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow(); 
		int endPageNum = pu.getEndPageNum();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("endPageNum",endPageNum);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("mList",service.getList(map));
		
		return "admin/memberList";
	}
}
