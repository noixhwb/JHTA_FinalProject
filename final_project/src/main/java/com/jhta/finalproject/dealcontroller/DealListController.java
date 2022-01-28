package com.jhta.finalproject.dealcontroller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.service.DealService;
import com.jhta.finalproject.vo.DealVo;
import com.jhta.finalproject.vo.Goods_ImageVo;
import com.util.PageUtil;

@Controller
public class DealListController {
	@Autowired private DealService service;
	@GetMapping("/deal/deallist")
	public String list(@RequestParam(value="pageNum",defaultValue="1") int pageNum, String word, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("word", word);
		int totalRowCount = service.count(map);
		PageUtil pu = new PageUtil(pageNum, 6,5,totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow",endRow);
		List<Goods_ImageVo> imglist = new ArrayList<Goods_ImageVo>();
		List<DealVo> list =service.selectAll(map);
		for(DealVo li:list) {
			List<Goods_ImageVo> img = service.selectImg(li.getT_num());
			imglist.add(img.get(0));
		}
		model.addAttribute("list", list);
		model.addAttribute("imglist", imglist);
		model.addAttribute("pu", pu);
		model.addAttribute("word",word);
		return "deal/dealmain";
	}
}
