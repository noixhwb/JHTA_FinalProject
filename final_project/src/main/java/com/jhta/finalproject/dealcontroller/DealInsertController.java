package com.jhta.finalproject.dealcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.service.DealService;

@Controller
public class DealInsertController {
	@Autowired private DealService service;
	@GetMapping("/deal/dealinsert")
	public String insertForm() {
		return "deal/dealinsert";
	}
}
