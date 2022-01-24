package com.jhta.fianlproject.Joincontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class JoinController {
	@Autowired private MemberService service;
	
	@GetMapping("/member/join")
	public String joinForm() {
		return "member/join";
	}
	@PostMapping("/member/join")
	public String join(MemberVo vo) {  
		service.insert(vo);
		return "member/success";
		
	}
	
}
