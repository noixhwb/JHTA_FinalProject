package com.jhta.finalproject.jobcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class MemberDetail {
	
	@Autowired MemberService service;
	
	@GetMapping("/member/memberDetail")
	public String memberDetail(String m_id, Model model) {
		MemberVo vo=service.selectUser(m_id);
		model.addAttribute("vo",vo);
		
		return "member/mymember";
	}
}
