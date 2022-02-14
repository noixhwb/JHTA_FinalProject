package com.jhta.finalproject.dealcontroller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.service.DealService;
import com.jhta.finalproject.vo.DealVo;
import com.jhta.finalproject.vo.Purchase_infoVo;

@Controller
public class DealManagementController {
	@Autowired private DealService service;
	
	@GetMapping("/deal/management")
	public String move(Principal principal,Model model) {
		String m_id = principal.getName();
		int m_num= service.selectMember(m_id).getM_num();
		List<Purchase_infoVo> pvo = service.select_pi(m_num);
		List<DealVo> dvo = service.select_dl(m_num);
		model.addAttribute("dvo",dvo);
		model.addAttribute("pvo",pvo);
		return "/deal/dealmanagement";
	}
}
