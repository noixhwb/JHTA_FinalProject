package com.jhta.finalproject.circlecontroller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.circlevo.CircleAdmJoinVo;
import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.service.CircleAdminService;
import com.util.PageUtil;

@Controller
public class CircleAdminController {
	@Autowired private CircleAdminService service;
	
	@GetMapping("/admin/appliedCircleList")
	public String appliedcirclelist(String category, 
									String keyword, 
									@RequestParam(value="pageNum",defaultValue = "1") int pageNum, 
									Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("category", category);
		map.put("keyword", keyword);
		System.out.println("카테:"+category);
		System.out.println("키워드:"+keyword);
		int totalRowCount = service.getCircleCount(map);
		System.out.println("@@@"+totalRowCount);
		PageUtil pu=new PageUtil(pageNum, 6, 5, totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		System.out.println("시작:"+startRow);
		System.out.println("끝:"+endRow);
		System.out.println("pageutil:"+pu);
		List<CircleAdmJoinVo> appliedcirclelist = service.appliedCircleList(map); 
		model.addAttribute("appliedcirclelist", appliedcirclelist);
		
		System.out.println("리스트:"+appliedcirclelist);
		System.out.println("동아리 게시요청 페이지로 이동");
		return "admin/appliedCircleList";
	}
	
	// 승인 메소드
	@GetMapping(value="/admin/comfirmCircle",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody Model comfirmCircle(int ci_num, Model model){
		try {
			service.confirmCircle(ci_num);
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
			service.rejectCircle(ci_num);
			return model.addAttribute("result","true");
		}catch(Exception e) {
			e.printStackTrace();
			return model.addAttribute("result","false");
		}
	}
}
