package com.jhta.finalproject.timetablecontroller;

import java.security.Principal;
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
import com.jhta.finalproject.timetablevo.TimetableVo;

@Controller
public class ScoreController {
	@Autowired private ServletContext sc;
	@Autowired private SubjectService service;
	@Autowired private MemberService m_service;
	@Autowired private TimetableService t_service;

	@GetMapping("/timetable/score")
	public String tableSubject(Principal principal,Model model) {
		sc.setAttribute("cp", sc.getContextPath());
		String m_id = principal.getName();
		int m_num = m_service.isMember(m_id).getM_num();
		model.addAttribute("m_num", m_num);
		
		List<TimetableVo> list=t_service.tableListName(m_num);
		model.addAttribute("list", list);
		return "timetable/score";
	}
	
	
}
