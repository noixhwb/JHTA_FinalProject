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
import com.jhta.finalproject.service.RegisterService;
import com.jhta.finalproject.service.SubjectService;
import com.jhta.finalproject.service.TimetableService;
import com.jhta.finalproject.timetablevo.SubjectVo;
import com.jhta.finalproject.timetablevo.TimetableVo;
import com.jhta.finalproject.timetablevo.RegisterVo;

@Controller
public class ScoreController {
	@Autowired private ServletContext sc;
	@Autowired private SubjectService service;
	@Autowired private MemberService m_service;
	@Autowired private TimetableService t_service;
	@Autowired private RegisterService r_service;

	//학점페이지로 이동, 시간표목록,학기목록 포함
	@GetMapping("/timetable/score")
	public String tableSubject(Principal principal, Model model) {
		sc.setAttribute("cp", sc.getContextPath());
		String m_id = principal.getName();
		int m_num = m_service.isMember(m_id).getM_num();
		model.addAttribute("m_num", m_num);

		List<TimetableVo> tablelist = t_service.tableListName(m_num);
		model.addAttribute("tablelist", tablelist);
		List<RegisterVo> termlist = r_service.termListName(m_num);
		model.addAttribute("termlist", termlist);
		return "timetable/score";
	}

	// 과목명,학점,성적,학기이름 받아와서 insert하기
	@GetMapping(value = "/timetable/registerInsert", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> insert(String r_name, String s_name, int s_score, Double m_score,
			Principal principal) {
		String m_id = principal.getName();
		int m_num = m_service.isMember(m_id).getM_num();
		int n = r_service.insert(new RegisterVo(0, m_num, s_name, s_score, m_score, r_name));
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (n != 0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

	//학기정보 불러와서 강의정보 리턴하기
		@GetMapping(value="/timetable/termDetailLoad", produces={MediaType.APPLICATION_JSON_VALUE})
		public @ResponseBody HashMap<String, Object> termDetailLoad(String r_name, Principal principal) {
			String m_id= principal.getName();
			int m_num=m_service.isMember(m_id).getM_num();
			
			HashMap<String,Object> map=new HashMap<String, Object>();
			map.put("m_num", m_num);
			map.put("r_name", r_name);
			List<RegisterVo> termlist=r_service.termDetail(map);
			if(termlist==null) {
				map.put("result", false);
			}else {
				map.put("result", true);
				map.put("termlist", termlist);
			}
			return map;
		}	
}
