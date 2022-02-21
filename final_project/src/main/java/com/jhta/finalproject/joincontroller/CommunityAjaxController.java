package com.jhta.finalproject.joincontroller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.finalproject.service.CommunityService;
import com.jhta.finalproject.vo.MemberVo;
import com.jhta.finalproject.vo.MyCommunityVo;

@RestController
public class CommunityAjaxController {
	@Autowired private CommunityService service;
	
	@GetMapping(value= "/community/add", produces = { MediaType.APPLICATION_JSON_VALUE })
	public HashMap<String, Object> add(int cu_num,Principal principal) {
		MemberVo vo1 = service.selectUser(principal.getName());
		int mnum = vo1.getM_num();
		int result = service.insertmyc(new MyCommunityVo(0,cu_num, mnum));
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(result>0) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		return map;
	}
}
