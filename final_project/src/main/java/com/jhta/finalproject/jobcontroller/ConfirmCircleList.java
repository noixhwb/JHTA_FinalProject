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

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.service.AdminService;
import com.util.PageUtil;

@Controller
public class ConfirmCircleList {
	
	@Autowired AdminService Aservice;
	
	// 동아리 개시요청 리스트 가져오기
	@GetMapping("/admin/appliedCircleListt")
	public String appliedCircleListt (@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
			String keyword, Model model ) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		// 페이징 기능
		int totalRowCount = Aservice.getCircleCount();
		PageUtil pu=new PageUtil(pageNum, 6, 5, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow(); 
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<CircleVo> appliedcirclelist = Aservice.appliedCircleList(map);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("appliedcirclelist",appliedcirclelist);
		return "admin/appliedCircleList";
	}
	
	/*
	// 승인 메소드
	@GetMapping(value="/admin/comfirmCircle",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody Model comfirmCircle(int ci_num, Model model){
		try {
			Aservice.confirmCircle(ci_num);
			return model.addAttribute("result","true");
		}catch(Exception e) {
			e.printStackTrace();
			return model.addAttribute("result","false");
		}
		
	}
	
	// 거절 메소드
	@GetMapping(value="/admin/rejectCircle",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody Model rejectCircle(int ci_num, Model model){
		try {
			Aservice.rejectCircle(ci_num);
			return model.addAttribute("result","true");
		}catch(Exception e) {
			e.printStackTrace();
			return model.addAttribute("result","false");
		}
	}
	*/
}
