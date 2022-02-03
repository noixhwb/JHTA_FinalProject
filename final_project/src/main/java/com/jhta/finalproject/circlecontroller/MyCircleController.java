package com.jhta.finalproject.circlecontroller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.circlevo.MyCircleJoinVo;
import com.jhta.finalproject.service.CircleService;
import com.jhta.finalproject.service.MyCircleService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class MyCircleController {
	//내 동아리 페이지로 이동
	@Autowired private MyCircleService mservice;
	@Autowired private CircleService cservice;
	
	@GetMapping("/circle/MyCircle")
	public String mycircle(Model model, Principal principal) {
		System.out.println("@");
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		System.out.println("@@"+userMnum);
		List<MyCircleJoinVo> list = mservice.selectAllMyJoin(userMnum);
		System.out.println("@@@"+list);
		model.addAttribute("list", list);
		return "circle/MyCircle";
	}
}
