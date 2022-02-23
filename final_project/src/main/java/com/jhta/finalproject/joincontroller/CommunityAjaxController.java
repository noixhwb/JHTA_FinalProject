package com.jhta.finalproject.joincontroller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.circlevo.LikeCircleVo;
import com.jhta.finalproject.service.CommunityService;
import com.jhta.finalproject.vo.CommentsVo;
import com.jhta.finalproject.vo.MemberVo;
import com.jhta.finalproject.vo.MyCommunityVo;

@RestController
public class CommunityAjaxController {
	@Autowired private CommunityService service;
	
	
	@RequestMapping(value= "/community/add/{cu_num}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> add(@PathVariable("cu_num") int cu_num,Principal principal) {
		MemberVo vo1 = service.selectUser(principal.getName());
		int mnum = vo1.getM_num();
		int result = service.insertmyc(new MyCommunityVo(0,cu_num, mnum));
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(result>0) {
			service.addLike(cu_num);
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		return map;
	}
	
	@GetMapping("/community/LikecommInsert")
	public @ResponseBody HashMap<String, Object> likecircleinsert(int cu_num, Principal principal, Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		int userMnum = vo.getM_num();
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		try {
			service.insertmyc(new MyCommunityVo(0,cu_num, userMnum));
			map.put("result", "success");
			service.addLike(cu_num);
			System.out.println("좋아요 등록 완료!");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			System.out.println("좋아요 등록 실패!");
		}
		return map;
	}
	
	//좋아요 누르기 취소
	@GetMapping("/community/LikecommDelete")
	public @ResponseBody HashMap<String, Object> likecircledelete(int cu_num, Principal principal, Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		int userMnum = vo.getM_num();
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cu_num", cu_num);
		map.put("m_num", userMnum);
		
		System.out.println(cu_num);
		System.out.println(userMnum);
		service.mycommdelete(map);
		
		
		service.likedelete(cu_num);
		return map;
	}
}


