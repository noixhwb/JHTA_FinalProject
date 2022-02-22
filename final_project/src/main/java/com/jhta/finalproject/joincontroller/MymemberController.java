package com.jhta.finalproject.joincontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.vo.MemberVo;



@Controller
public class MymemberController {
	@Autowired MemberService service;
	
	@Autowired private ServletContext sc;
	
	@GetMapping("/member/mymember")
	public String memberForm(Principal principal,Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		model.addAttribute("vo",vo);
		  
		 
		return "member/mymember";
	}
	
	@GetMapping("/member/mymemberpwd")
	public String memberpwd(Principal principal,Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		model.addAttribute("vo",vo);
		
		
		return "member/mymemberpwd";
	}
	@GetMapping("/member/mymemberprofile")
	public String memberprofile(Principal principal,Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		model.addAttribute("vo",vo);
		
		
		return "member/mymemberprofile";
	}
	@GetMapping("/member/mymembernick")
	public String membernick(Principal principal,Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		model.addAttribute("vo",vo);
		
		
		return "member/mymembernick";
	}
	@GetMapping("/member/mymemberdept") 
	public String memberdept(Principal principal,Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		model.addAttribute("vo",vo);
		
		
		return "member/mymemberdept";
	}
	@GetMapping("/member/updateaddress")
	public String uaddr(Principal principal,Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		model.addAttribute("vo",vo);
		
		
		return "member/updateaddress";
	}
	
	
	@PostMapping("/member/updateaddr")
	public String addupdate(MemberVo vo,Model model) {
	//	System.out.println(vo);
		
			service.addrupdate(vo);
		
		return "redirect:/member/mymember";
	}
	@PostMapping("/member/nickchange")
	public String allupdate(MemberVo vo,Model model) {
	//	System.out.println(vo);
		
			service.allupdate(vo);
		
		return "redirect:/member/mymember";
	}
	
	@PostMapping("/member/deptchange")
	public String deptupdate(MemberVo vo,Model model) {
	//	System.out.println(vo);
		
			service.deptupdate(vo);
		
		return "redirect:/member/mymember";
	}
	@PostMapping("/member/pwdupdate")
	public String pwdupdate(MemberVo vo,Model model) {
		System.out.println("비밀번호 변경실행");
	
			service.pwdupdate(vo);
		 
		return "redirect:/member/mymember";
	}
	
	
		
		
			
		
	
	
	
}


		

	

	

