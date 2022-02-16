package com.jhta.finalproject.joincontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.service.CommunityService;
import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.MemberVo;

@Controller
	public class CommunityController {
	@Autowired CommunityService service;
	
	@Autowired private ServletContext sc;
	
	
	@GetMapping("/community/communityInsertForm")//커뮤니티 게시요청 폼
	public String insertForm(Principal principal,Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		
		model.addAttribute("vo",vo);
		
		System.out.println("커뮤니티 게시요청 페이지");
		return "community/communityInsertForm";
	}
	
	@PostMapping("/community/communityInsert")
	public String communityinsert(CommunityVo vo, MultipartFile file1, Model model, Principal principal) {
		String path = sc.getRealPath("/resources/comm");
		System.out.println(path);
		
		String cu_coverimg  = file1.getOriginalFilename(); 
		
		try {
			InputStream is1 = file1.getInputStream(); 
			File f1=new File(path + "\\" + cu_coverimg );
			System.out.println("커뮤니티대표사진:"+f1);
			FileOutputStream fos1=new FileOutputStream("C:\\Users\\hs023\\git\\hta_finalproject\\final_project\\src\\main\\webapp\\resources\\comm\\" + cu_coverimg );
			FileCopyUtils.copy(is1, fos1);
		
			is1.close();
		
			fos1.close();
			

			MemberVo vo1 = service.selectUser(principal.getName());
			int mnum = vo1.getM_num();
			model.addAttribute("mvo", vo1);
			model.addAttribute("mnum", mnum);
			service.insertcm(new CommunityVo(0, vo.getCu_name(), vo.getCu_intro(),vo.getCu_category(), vo.getCu_notice(), vo.getCu_recommend(), cu_coverimg, mnum, vo.getCu_status()));
			model.addAttribute("result","success");
			System.out.println("성공");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
			System.out.println("실패");
		}
		return "/home";
	}
	
	
	
	

	@GetMapping("/community/communityList")
	public String communitylist(Model model) {
		System.out.println("커뮤니티 페이지");
		List<CommunityVo> list = service.selectAll();
		
		
		model.addAttribute("list", list);
		return "community/communityList";
	}
	
	@GetMapping("/community/communityMy")
	public String memberForm(Principal principal,Model model) {
		
		System.out.println("my커뮤니티 페이지");
		
		
		return "community/communityMy";
				
	}
	
}

	


	
	

	
