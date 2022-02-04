package com.jhta.finalproject.circlecontroller;

import java.security.Principal;
import java.util.HashMap;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.circlevo.MyCircleVo;
import com.jhta.finalproject.service.CircleService;
import com.jhta.finalproject.service.MyCircleService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class MyCircleJoinController {
	//동아리 신청 or 취소
	@Autowired private MyCircleService mservice;
	@Autowired private CircleService cservice;
	@Autowired private ServletContext sc;
	
	//동아리 신청하기
	@GetMapping("/circle/MyCircleJoin")
	public String mycirclejoin(int ci_num, Principal principal) {
		//내동아리번호(SEQ)
		//동아리번호 (페이지 참조)
		//회원번호 (CIRCLE 참조)
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		
		mservice.insert(new MyCircleVo(0, ci_num, userMnum));
		
		return "redirect:/circle/MyCircleList";
	}
	
	//동아리 신청 취소하기
	@GetMapping("/circle/MyCircleJoinCancel")
	public String mycirclejoincancel(int ci_num, Principal principal) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		//동아리번호 (페이지 참조)
		//회원번호 (CIRCLE 참조)
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		map.put("ci_num", ci_num);
		map.put("m_num", userMnum);
		mservice.delete(map);
		return "redirect:/circle/MyCircleList";
	}
}
