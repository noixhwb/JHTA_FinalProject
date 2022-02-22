package com.jhta.finalproject.circlecontroller;

import java.io.File;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.service.CircleService;
import com.jhta.finalproject.vo.MemberVo;
import com.util.PageUtil;

@Controller
public class CircleListController {
	@Autowired private CircleService service;
	
	//전체 동아리 페이지로 이동
	@RequestMapping("/circle/CircleList")
	public String circlelist(String category,
							 String keyword,
							 String name,
							 String keywords,
							 String order,
							 @RequestParam(value="pageNum", defaultValue="1") int pageNum,
							 Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("name", name);
		map.put("keywords", keywords);
		int totalRowCount = service.count(map);
		System.out.println("@@@"+totalRowCount);
		
		PageUtil pu=new PageUtil(pageNum, 6, 5, totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		System.out.println("시작:"+startRow);
		System.out.println("끝:"+endRow);
		System.out.println("pageutil:"+pu);
		
		List<CircleVo> catlist = null;
		if(order==null) {
			catlist=service.selectCat(map);
		}else if(order!=null&&order.equals("1")) {
			catlist= service.selectCatView(map); //여기가 조회수순입니다!
		}else if (order!=null && order.equals("2")) {
			catlist = service.selectCatRec(map); //좋아요순
		}
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		model.addAttribute("name", name);
		model.addAttribute("keywords", keywords);
		model.addAttribute("catlist", catlist);
		
		model.addAttribute("pu", pu);
		System.out.println("카테고리@"+category);
		System.out.println("키워드@"+keyword);
		System.out.println("동아리이름@"+name);
		System.out.println("키워드1@"+keywords);
		System.out.println("리스트@"+catlist); 
		
		System.out.println("동아리 목록 페이지로 이동");
		return "circle/CircleList";
	}
	
	@PostMapping("/circle/removeBoard")
	public String removeboard(int ci_num, Model model) {
		int n = service.removelike(ci_num);
		int nn = service.removeb(ci_num);
		System.out.println("@"+ci_num);
		System.out.println("@@"+n);
		System.out.println("@@@"+nn);
		System.out.println("게시글 삭제 완료!"+ci_num);
		return "redirect:/circle/CircleList";
	}
	
	@PostMapping("/circle/removeCircle")
	public String removecircle(int ci_num, Model model) {
		int n = service.removelike(ci_num);
		int nn = service.remove(ci_num);
		System.out.println("@"+ci_num);
		System.out.println("@@"+n);
		System.out.println("@@@"+nn);
		System.out.println("동아리 삭제 완료!"+ci_num);
		return "redirect:/circle/CircleList";
	}
}
