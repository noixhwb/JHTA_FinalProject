package com.jhta.finalproject.joincontroller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.service.CommunityService;

@Controller
public class MyCommunityController {

	@Autowired CommunityService service;
	
	
	@GetMapping("/community/communityMy")
	public String commMy() {
		
		
		System.out.println("커뮤마이페이지");
		
		return "community/communityMy";
				
	}

	@GetMapping("/community/communityMyLike")
	public String commlike() {
		
		System.out.println("커뮤좋아요페이지");
		
		return "community/communityMyLike";
				
	}

	@GetMapping("/community/communityMyList")
	public String commlist() {
		
		
		System.out.println("커뮤댓글페이지");
		
		return "community/communityMyList";
				
	}
}
