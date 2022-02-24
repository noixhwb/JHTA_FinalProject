package com.jhta.finalproject.jobcontroller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.service.AdminService;
import com.jhta.finalproject.vo.CommunityVo;
import com.util.PageUtil;

@Controller
public class ConfirmCommuList {
	
	@Autowired AdminService Aservice;
	
	// 커뮤니티 개시요청 리스트 가져오기
	@GetMapping("/admin/appliedCommuList")
	public String appliedCommuList (@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
			String keyword, Model model ) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		// 페이징 기능
		int totalRowCount = Aservice.getCommuCount();
		PageUtil pu=new PageUtil(pageNum, 6, 5, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow(); 
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<CommunityVo> commList = Aservice.appliedCommuList(map);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("commList",commList);
		return "admin/appliedCommList";
	}
	
	// 승인 메소드
	@GetMapping(value="/admin/confirmCommu",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody Model confirmCommu(int cu_num, Model model){
		try {
			Aservice.confirmCommu(cu_num);
			return model.addAttribute("result","true");
		}catch(Exception e) {
			e.printStackTrace();
			return model.addAttribute("result","false");
		}
	}
		
	// 거절 메소드
	@GetMapping(value="/admin/rejectCommu",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody Model rejectCommu(int cu_num, Model model){
		try {
			Aservice.rejectCommu(cu_num);
			return model.addAttribute("result","true");
		}catch(Exception e) {
			e.printStackTrace();
			return model.addAttribute("result","false");
		}
	}
}
