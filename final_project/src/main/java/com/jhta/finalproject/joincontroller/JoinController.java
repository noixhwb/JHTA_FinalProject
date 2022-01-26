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
	
	@GetMapping("/join")
	public String joinForm() {
		System.out.println("컨트롤러작동중");
		return "/join";
	}
	@PostMapping("/join")
	public String join(MemberVo vo) {     
		service.addUser(vo);
		return "member/success";
		
	}
	
}
