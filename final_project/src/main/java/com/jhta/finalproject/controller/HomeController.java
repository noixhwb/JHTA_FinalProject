package com.jhta.finalproject.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@Autowired ServletContext sc;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		sc.setAttribute("cp",sc.getContextPath());
		return "index";
	}
	
}
