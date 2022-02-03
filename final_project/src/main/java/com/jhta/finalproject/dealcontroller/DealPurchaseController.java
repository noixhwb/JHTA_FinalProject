package com.jhta.finalproject.dealcontroller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.service.DealService;

@Controller
public class DealPurchaseController {
	@Autowired DealService service;
	@GetMapping("/deal/dealpurchase")
	public String purchaseform(int t_num,String m_id,Model model, Principal principal) {
		//구매자 정보 로그인한 아이디 기반으로 찾음
		model.addAttribute("pvo",service.selectMember(principal.getName()));
		//판매자 정보 m_id 기반으로 찾음
		model.addAttribute("svo",service.selectMember(principal.getName()));
		//상품 정보 t_num 기반으로 찾음
		model.addAttribute("dvo",service.selectOne(t_num));
		//상품 이미지 t_num 기반으로 찾음
		model.addAttribute("imglist",service.selectImg(t_num));
		return "deal/dealpurchase";
	}
}
