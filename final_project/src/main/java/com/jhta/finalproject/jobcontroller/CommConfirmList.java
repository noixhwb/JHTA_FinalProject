package com.jhta.finalproject.jobcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.service.JobService;

@Controller
public class CommConfirmList {
	@Autowired private JobService Jservice;
	
	@GetMapping("/admin/commConfirm")
	public String commConfirm() {
		return "";
	}
}
