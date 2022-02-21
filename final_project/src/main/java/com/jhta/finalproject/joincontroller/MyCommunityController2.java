package com.jhta.finalproject.joincontroller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.service.CommunityService;
import com.jhta.finalproject.service.DealService;
import com.jhta.finalproject.vo.BoardVo;
import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.MycommBoVo;

@Controller
public class MyCommunityController2 {
	@Autowired private CommunityService service;
	@Autowired private DealService dservice;
	
	@GetMapping("community/mycommunity")
	public String mycomm(Principal principal, Model model) {
		
		int m_num = dservice.selectMember(principal.getName()).getM_num();
		List<CommunityVo> mc= service.selectmc(m_num);
		List<MycommBoVo> mb= new ArrayList<MycommBoVo>();
		List<BoardVo> bd = service.selectboard(m_num);
		for(BoardVo vo:bd) {
			CommunityVo aa = service.selectcm(vo.getCu_num());
			String i_filename = service.selectbi(vo.getB_num());
			MycommBoVo bb = new MycommBoVo(vo.getB_num(), vo.getM_num(),vo.getB_content(),vo.getB_regdate(),vo.getB_recommend(),vo.getCu_num(),vo.getB_title(),i_filename,aa.getCu_name());
		}
		model.addAttribute("mlist",service.selectcc(m_num));
		model.addAttribute("blist",mb);
		model.addAttribute("clist",mc);
		System.out.println(mb);
		System.out.println(mc);
		return "/community/communityMyLike";
	}
}
