package com.jhta.finalproject.joincontroller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.vo.MemberVo;


@Controller
public class MymemberController {
	@Autowired MemberService service;
	@GetMapping("/member/mymember")
	public String memberForm(Principal principal,Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		model.addAttribute("vo",vo);
		
		
		return "member/mymember";
	}
	
	
		
		

	

	
}
