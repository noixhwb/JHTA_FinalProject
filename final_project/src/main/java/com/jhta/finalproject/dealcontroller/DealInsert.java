package com.jhta.finalproject.dealcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.finalproject.service.DealService;
import com.jhta.finalproject.vo.DealVo;

@Controller
public class DealInsert {
	@Autowired private DealService service;
	@GetMapping("/deal/dealinsert")
	public String insertForm() {
		return "deal/dealinsert";
	}
	@PostMapping("/deal/dealinsert")
	public String insert(DealVo vo) {
		service.insert(vo);
		return "redirect:deal/deallist";
	}
}
