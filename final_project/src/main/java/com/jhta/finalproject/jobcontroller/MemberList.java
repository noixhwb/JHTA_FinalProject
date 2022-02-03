package com.jhta.finalproject.jobcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.service.MemberService;

@Controller
public class MemberList {
	@Autowired private MemberService service;
	
	@GetMapping("/admin/memberList")
	public String showList(Model model) {
		model.addAttribute("mList",service.selectAll());
		return "admin/memberList";
	}
}
