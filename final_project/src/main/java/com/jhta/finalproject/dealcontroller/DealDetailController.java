package com.jhta.finalproject.dealcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.service.DealService;
import com.jhta.finalproject.vo.DealVo;
import com.jhta.finalproject.vo.Goods_ImageVo;

@Controller
public class DealDetailController {
	@Autowired private DealService service;
	
	@GetMapping("/deal/dealdetail")
	public String detail(int t_num, Model model) {
		//t_num//deal//dealimg//
		DealVo vo = service.selectOne(t_num);
		List<Goods_ImageVo> imglist = service.selectImg(t_num);
		model.addAttribute("imglist",imglist);
		model.addAttribute("vo",vo);
		return "deal/dealdetail";
		
	}
}
