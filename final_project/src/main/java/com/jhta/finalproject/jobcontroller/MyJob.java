package com.jhta.finalproject.jobcontroller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jobvo.MyJobVo;
import com.jhta.finalproject.service.JobService;
import com.jhta.finalproject.service.MyJobService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class MyJob {
	@Autowired MyJobService MJservice;
	@Autowired JobService Jservice;
	
	@GetMapping("/job/myScrap")
	public String scrapList(Model model,Principal principal ) {
		MemberVo uservo = Jservice.selectUser(principal.getName());
		int userNum = uservo.getM_num();
		List<MyJobVo> list = MJservice.myScrap(userNum);
		model.addAttribute("list",list);
		return "job/myScrap";
	}
	
	@GetMapping(value="/job/scrapInsert",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> scrapInsert(int j_num, Model model, Principal principal) {
		
		HashMap<String,Object> map=new HashMap<String, Object>();
		
		MemberVo uservo = Jservice.selectUser(principal.getName());
		int userNum = uservo.getM_num();
		MyJobVo vo=new MyJobVo(0, j_num, userNum);
		
		try {
			MJservice.insert(vo);
			map.put("result", true);
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", false);
		}
		return map;
	}
	
	@GetMapping(value="/job/scrapDelete",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody String scrapDelete(int j_num, Model model, Principal principal) {
		MemberVo uservo = Jservice.selectUser(principal.getName());
		int userNum = uservo.getM_num();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("j_num", j_num);
		map.put("m_num", userNum);
		MJservice.delete(map);
		return "job/myScrap";
	}
	
}
