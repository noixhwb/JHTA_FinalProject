package com.jhta.finalproject.timetablecontroller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.service.SubjectService;
import com.jhta.finalproject.service.TimetableService;
import com.jhta.finalproject.timetablevo.SubjectVo;
import com.jhta.finalproject.timetablevo.Timetable2Vo;
import com.jhta.finalproject.timetablevo.TimetableVo;

@Controller
public class TableController {
	@Autowired private ServletContext sc;
	@Autowired private SubjectService service;
	@Autowired private TimetableService t_service;
	@Autowired private MemberService m_service;

	//시간표 페이지로 이동 + 과목목록출력
	@GetMapping("/timetable/table")
	public String subjectList(Principal principal,Model model) {
		sc.setAttribute("cp", sc.getContextPath());
		String m_id = principal.getName();
		int m_num = m_service.isMember(m_id).getM_num();
		model.addAttribute("m_num", m_num);
		
		List<SubjectVo> list = service.subjectListAll();
		model.addAttribute("list", list);
		List<TimetableVo> tablelist=t_service.tableListName(m_num);
		model.addAttribute("tablelist", tablelist);
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
	@GetMapping(value="/timetable/tableInsert1", produces={MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> insert(String tt_name, String numList, Principal principal) {
		String m_id= principal.getName();
		int m_num=m_service.isMember(m_id).getM_num();
		String[] numArray = numList.split("&");
		int n=0;
		for(int i=0;i<numArray.length;i++) {
			SubjectVo vo = service.selectOne(Integer.parseInt(numArray[i]));
			n=t_service.insert(new TimetableVo(0, m_num, vo.getS_name(), vo.getS_score(), 0, tt_name));
		}
		HashMap<String,Object> map=new HashMap<String, Object>();
		if(n!=0) {
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		return map;
	}
	
	//과목명,학점,성적,시간표 이름 받아와서 insert하기
	@GetMapping(value="/timetable/tableInsert2", produces={MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> insert(String tt_name, String s_name, int s_score, int m_score, Principal principal) {
		String m_id= principal.getName();
		int m_num=m_service.isMember(m_id).getM_num();
		int n=t_service.insert(new TimetableVo(0, m_num, s_name, s_score, m_score, tt_name));
		HashMap<String,Object> map=new HashMap<String, Object>();
		if(n!=0) {
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		return map;
	}
	
	@GetMapping(value="/timetable/tableDetailLoad", produces={MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> tableDetailLoad(String tt_name, Principal principal) {
		String m_id= principal.getName();
		int m_num=m_service.isMember(m_id).getM_num();
		
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("m_num", m_num);
		map.put("tt_name", tt_name);
		List<Timetable2Vo> tablelist=t_service.tableDetail(map);
		if(tablelist==null) {
			map.put("result", false);
		}else {
			List<SubjectVo> list= new ArrayList<SubjectVo>();
			for(Timetable2Vo tvo:tablelist) {
				SubjectVo vo = service.selectOne(tvo.getS_num());
				list.add(vo);
			}
			map.put("result", true);
			map.put("list", list);
		}
		return map;
	}
}
