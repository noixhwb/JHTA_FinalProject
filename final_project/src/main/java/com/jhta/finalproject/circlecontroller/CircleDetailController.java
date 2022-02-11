package com.jhta.finalproject.circlecontroller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.circlevo.LikeCircleVo;
import com.jhta.finalproject.service.CircleService;
import com.jhta.finalproject.service.LikeCircleService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class CircleDetailController {
		//동아리 + 게시글 등록 페이지로 이동
		@Autowired private CircleService service;
		@Autowired private LikeCircleService lservice;
		
		@GetMapping("/circle/CircleDetail")
		public String circledetail(int ci_num, Model model, Principal principal) {
			
			CircleVo sel = service.select(ci_num);
			model.addAttribute("sel", sel);
			int selectedPerson = service.selectPerson(ci_num);
			model.addAttribute("selectedPerson", selectedPerson);
			
			int likePerson = lservice.selectLikeCircle(ci_num);
			model.addAttribute("likePerson", likePerson);
			
			MemberVo uservo = service.selectM(principal.getName());
			int userMnum = uservo.getM_num();
			
			HashMap<String, Integer> map=new HashMap<String, Integer>();
			map.put("m_num", userMnum);
			map.put("ci_num", ci_num);
			int nmap = service.selectMeRegister(map);
			
			HashMap<String, Integer> mymap=new HashMap<String, Integer>();
			mymap.put("m_num", userMnum);
			mymap.put("ci_num", ci_num);
			int nmymap = service.selectMyCircleCount(mymap);
			
			HashMap<String, Integer> maplike=new HashMap<String, Integer>();
			maplike.put("m_num", userMnum);
			maplike.put("ci_num", ci_num);
			int nmaplike = lservice.selectMeLikeCircle(maplike);
			
			model.addAttribute("nmymap", nmymap);
			model.addAttribute("nmaplike", nmaplike);
			model.addAttribute("nmap", nmap);
			model.addAttribute("ci_num", ci_num);
			model.addAttribute("m_num", userMnum);
			
			System.out.println("@"+ci_num);
			System.out.println("@"+userMnum);
			System.out.println("@@@"+nmaplike);
			System.out.println("@@@@"+nmap);
			System.out.println("상세페이지로 이동 "+sel);
			return "circle/CircleDetail";
		}
		
		//좋아요 누르기
		@GetMapping("/circle/LikeCircleInsert")
		public @ResponseBody HashMap<String, Object> likecircleinsert(int ci_num, Principal principal, Model model) {
			MemberVo uservo = service.selectM(principal.getName());
			int userMnum = uservo.getM_num();
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			try {
				lservice.insert(new LikeCircleVo(0, ci_num, userMnum));
				map.put("result", "success");
				System.out.println("좋아요 등록 완료!");
			} catch (Exception e) {
				e.printStackTrace();
				map.put("result", "fail");
				System.out.println("좋아요 등록 실패!");
			}
			return map;
		}
		
		//좋아요 누르기 취소
		@GetMapping("/circle/LikeCircleDelete")
		public @ResponseBody HashMap<String, Object> likecircledelete(int ci_num, Principal principal, Model model) {
			MemberVo uservo = service.selectM(principal.getName());
			int userMnum = uservo.getM_num();
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("ci_num", ci_num);
			map.put("m_num", userMnum);
			lservice.delete(map);
			
			return map;
		}
}
