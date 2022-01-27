package com.jhta.finalproject.joincontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.vo.MemberVo;


@Controller
public class JoinController {
	@Autowired private MemberService service;
	
	@GetMapping("/join")
	public String joinForm() {
		System.out.println("컨트롤러작동중");
		return "/join";
	}
	@PostMapping("/join")
	public String join(MemberVo vo) {     
		service.addUser(vo);
		return "member/success";
		
	}
	
	@GetMapping(value="/isMember",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> isMember(String mid){
		MemberVo vo=service.isMember(mid);
		HashMap<String,Object> map=new HashMap<String, Object>();
		if(vo!=null) {
			map.put("using",true);
		}else {
			map.put("using",false);
		}
		return map;
	}

	@GetMapping(value="/isNick",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> isNick(String mnick){
		MemberVo vo=service.isNick(mnick);
		HashMap<String,Object> map=new HashMap<String, Object>();
		if(vo!=null) {
			map.put("using",true);
		}else {
			map.put("using",false);
		} 
		return map;
}
}
	
//    @RequestMapping(value="/idCheck", method=RequestMethod.POST)
//	public int idCheck(@RequestBody MemberVo vo) throws Exception {
//		String id = vo.getM_id();
//		int result = service.idCheck(id);
//		return result;
//	}

	

