package com.jhta.finalproject.timetablecontroller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.service.SubjectService;
import com.jhta.finalproject.service.TimetableService;
import com.jhta.finalproject.timetablevo.SubjectRateVo;
import com.jhta.finalproject.timetablevo.SubjectVo;
import com.util.PageUtil;

@Controller
public class TableController {
	@Autowired private ServletContext sc;
	@Autowired private SubjectService service;
	@Autowired private TimetableService t_service;

	//시간표 페이지로 이동 + 과목목록출력
	@GetMapping("/timetable/table")
	public String subjectList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			Model model) {
		sc.setAttribute("cp", sc.getContextPath());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", "");
		
		int totalRowCount = service.count(map);
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<SubjectVo> list = service.subjectList(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		return "timetable/table";
	}
	
	//과목에 마우스 오버하면 선택과목정보 ajax로 보내기
	@GetMapping(value="/timetable/selectOne", produces={MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> selectOne(int s_num) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		SubjectVo vo = service.selectOne(s_num);
		map.put("vo", vo);
		return map;
	}
	
	//과목 리스트랑 시간표 이름 받아와서 insert하기
	@PostMapping(value="/timetable/tableInsert", produces={MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> insert(String tt_name, String numList) {
		System.out.println("tt_name "+tt_name);
		System.out.println("numList "+numList);
		HashMap<String,Object> map=new HashMap<String, Object>();
		/*for(int i=0;i<=)
		int n= t_service.insert();*/
		map.put("result", true);
		System.out.println("컨트롤러다녀감");
		return map;
	}
}
