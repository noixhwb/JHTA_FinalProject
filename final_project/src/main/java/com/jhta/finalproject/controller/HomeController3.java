package com.jhta.finalproject.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController3 {
	@Autowired ServletContext sc;
	
	@RequestMapping(value = "/home/home2", method = RequestMethod.GET)
	public String home() {
		sc.setAttribute("cp",sc.getContextPath());
		/*
		 * model.addAttribute("header", sc.getContextPath()+"/home/header.jsp");
		 * model.addAttribute("main", sc.getContextPath()+"/home/home2.jsp");
		 * model.addAttribute("footer", sc.getContextPath()+"/home/footer.jsp");
		 */
		return "home/home2";
	}
	
}
