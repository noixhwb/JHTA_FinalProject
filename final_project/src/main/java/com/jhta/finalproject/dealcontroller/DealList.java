package com.jhta.finalproject.dealcontroller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.service.DealService;
import com.jhta.finalproject.vo.DealVo;
import com.util.PageUtil;

@Controller
public class DealList {
	@Autowired private DealService service;
	@GetMapping("/deal/deallist")
	public String list(@RequestParam(value="pageNum",defaultValue="1") int pageNum, String word, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("word", word);
		int totalRowCount = service.count(word);
		PageUtil pu = new PageUtil(pageNum, 9,5,totalRowCount);
		int startRow = pu.getStartRow();//시작행번호
		int endRow = pu.getEndRow();//끝행번호
		
		map.put("startRow", startRow);
		map.put("endRow",endRow);

		List<DealVo> list =service.selectAll(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("keyword",word);
		return "deal/dealist";
	}
}
