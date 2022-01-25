package com.jhta.finalproject.joincontroller;

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
		System.out.println("컨트롤러작동중");
		return "member/join";
	}
	@PostMapping("/member/join")
	public String join(MemberVo vo) {      
		service.insert(vo);
		return "member/success";
		
	}
	
}
