package com.jhta.finalproject.circlecontroller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.circlevo.MyCircleJoinVo;
import com.jhta.finalproject.service.CircleService;
import com.jhta.finalproject.service.MyCircleService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class MyCircleController {
	//내 동아리 페이지로 이동
	@Autowired private MyCircleService mservice;
	@Autowired private CircleService cservice;
	
	//동아리 관리 페이지로 이동
	@GetMapping("/circle/MyCircle")
	public String mycircle(Model model, Principal principal) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		List<MyCircleJoinVo> list = mservice.selectAllMyJoin(userMnum); //신청한동아리
		List<CircleVo> mylist = cservice.selectMyCircle(userMnum);//내가만든동아리
		model.addAttribute("list", list);
		model.addAttribute("mylist", mylist);
		return "circle/MyCircle";
	}
	
	//신청한 동아리 목록 페이지로 이동
	@GetMapping("/circle/MyCircleList")
	public String mycirclelist(Model model, Principal principal) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		List<MyCircleJoinVo> list = mservice.selectAllMyJoin(userMnum); //신청한동아리
		List<CircleVo> mylist = cservice.selectMyCircle(userMnum);//내가만든동아리
		model.addAttribute("list", list);
		model.addAttribute("mylist", mylist);
		return "circle/MyCircleList";
	}
	
	//좋아요한 동아리 목록 페이지로 이동
	@GetMapping("/circle/MyCircleLike")
	public String mycirclelike(Model model, Principal principal) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		List<MyCircleJoinVo> list = mservice.selectAllMyJoin(userMnum); //신청한동아리
		List<CircleVo> mylist = cservice.selectMyCircle(userMnum);//내가만든동아리
		model.addAttribute("list", list);
		model.addAttribute("mylist", mylist);
		return "circle/MyCircleLike";
	}
	
	//동아리 관리 페이지 - 동아리 정보 수정
	@GetMapping("/circle/MyCircleUpdate1")
	public String mycircleupdate1(Model model, Principal principal) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		List<MyCircleJoinVo> list = mservice.selectAllMyJoin(userMnum); //신청한동아리
		List<CircleVo> mylist = cservice.selectMyCircle(userMnum);//내가만든동아리
		model.addAttribute("list", list);
		model.addAttribute("mylist", mylist);
		return "circle/MyCircleLike";
	}
	
	//동아리 관리 페이지 - 게시글 수정
	@GetMapping("/circle/MyCircleUpdate2")
	public String mycircleupdate2(Model model, Principal principal) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		List<MyCircleJoinVo> list = mservice.selectAllMyJoin(userMnum); //신청한동아리
		List<CircleVo> mylist = cservice.selectMyCircle(userMnum);//내가만든동아리
		model.addAttribute("list", list);
		model.addAttribute("mylist", mylist);
		return "circle/MyCircleLike";
	}
}
