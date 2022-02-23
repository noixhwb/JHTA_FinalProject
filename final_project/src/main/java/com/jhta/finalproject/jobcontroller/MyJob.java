package com.jhta.finalproject.jobcontroller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jobvo.DutyVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.jobvo.MyJobVo;
import com.jhta.finalproject.service.DutyService;
import com.jhta.finalproject.service.JobService;
import com.jhta.finalproject.service.MyJobService;
import com.jhta.finalproject.vo.MemberVo;
import com.util.PageUtil;

@Controller
public class MyJob {
	@Autowired MyJobService MJservice;
	@Autowired JobService Jservice;
	@Autowired private DutyService Dservice;
	
	@GetMapping("/job/myScrap")
	public String scrapList(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
				Model model,Principal principal ) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", "");
		
		// 페이징
		int totalRowCount = Jservice.getCount(map);
		PageUtil pu=new PageUtil(pageNum, 6, 5, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow(); 
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		MemberVo uservo = Jservice.selectUser(principal.getName());
		int userNum = uservo.getM_num();
		List<MyJobVo> list = MJservice.myScrap(userNum);
		List<JobVo> getPopular = Jservice.getPopular();
		List<DutyVo> dutyList = Dservice.list();
		
		model.addAttribute("list",list);
		model.addAttribute("popularList",getPopular);
		model.addAttribute("dutyList",dutyList);
		
		return "job/myScrap";
	}
	
	@GetMapping(value="/job/scrapInsert",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> scrapInsert(int j_num, Principal principal) {
		
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
	public @ResponseBody HashMap<String, Object> scrapDelete(int j_num, Principal principal) {
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		MemberVo uservo = Jservice.selectUser(principal.getName());
		int userNum = uservo.getM_num();
		map.put("j_num", j_num);
		map.put("m_num", userNum);
		
		
		try {
			MJservice.Userdelete(map);
			map1.put("result", true);
		}catch(Exception e) {
			e.printStackTrace();
			map1.put("result", false);
		}
		return map1;
	}
	
}
