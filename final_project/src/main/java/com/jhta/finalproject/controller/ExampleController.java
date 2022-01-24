package com.jhta.finalproject.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExampleController {
	@Autowired ServletContext sc;
	
	@RequestMapping(value = "/example", method = RequestMethod.GET)
	public String example() {
		sc.setAttribute("cp",sc.getContextPath());
		//필요하신 작업 진행후 작업하신 파일로 이동하시는것은 똑같습니다. 특이사항 없음
		return "example";
	}
	
}
