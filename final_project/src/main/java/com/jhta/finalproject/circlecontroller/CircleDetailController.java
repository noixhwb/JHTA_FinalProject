package com.jhta.finalproject.circlecontroller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.service.CircleService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class CircleDetailController {
		//동아리 + 게시글 등록 페이지로 이동
		@Autowired private CircleService service;
		
		@GetMapping("/circle/CircleDetail")
		public String circledetail(int ci_num, Model model, Principal principal) {
			
			CircleVo sel = service.select(ci_num);
			model.addAttribute("sel", sel);
			int selectedPerson = service.selectPerson(ci_num);
			model.addAttribute("selectedPerson", selectedPerson);
			
			MemberVo uservo = service.selectM(principal.getName());
			int userMnum = uservo.getM_num();
			
			HashMap<String, Integer> map=new HashMap<String, Integer>();
			map.put("m_num", userMnum);
			map.put("ci_num", ci_num);
			service.selectMeRegister(map);
			System.out.println(map);
			model.addAttribute("map", map);
			
			System.out.println("상세페이지로 이동 "+sel);
			return "circle/CircleDetail";
		}
}
