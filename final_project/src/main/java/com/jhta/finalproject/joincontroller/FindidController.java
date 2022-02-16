package com.jhta.finalproject.joincontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class FindidController {
	
	private Logger log=LoggerFactory.getLogger(JoinController.class);
	@Autowired private MemberService service;
	@GetMapping("/member/findIdView")
	public String findIdView() {
		System.out.println("아이디찾기");
		return "member/findIdView";
	}


	@GetMapping(value="/member/isId",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> isId(String memail){
		MemberVo vo=service.isId(memail);
		log.info("아이디 찾기 ");
		HashMap<String,Object> map=new HashMap<String, Object>();
		if(vo!=null) {
			map.put("using",true);
			map.put("m_id", vo.getM_id());
		}else {
			map.put("using",false);
		} 
		return map;
		
	}
	
}

