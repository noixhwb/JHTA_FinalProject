package com.jhta.finalproject.circlecontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.circlevo.MyCircleJoinVo;
import com.jhta.finalproject.circlevo.MyCircleListVo;
import com.jhta.finalproject.service.CircleService;
import com.jhta.finalproject.service.MyCircleService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class MyCircleController {
	//내 동아리 페이지로 이동
	@Autowired private MyCircleService mservice;
	@Autowired private CircleService cservice;
	@Autowired private ServletContext sc;
	
	//동아리 관리 페이지로 이동
	@GetMapping("/circle/MyCircle")
	public String mycircle(Model model, Principal principal,HttpServletRequest request) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		List<CircleVo> mylist = cservice.selectMyCircle(userMnum);//내가만든동아리
		MyCircleListVo vvo = new MyCircleListVo();
		vvo.getCi_num();
		model.addAttribute("mylist", mylist);
		
		System.out.println("내 동아리 관리 페이지로 이동");
		return "circle/MyCircle";
	}
	
	//신청한 동아리 목록 페이지로 이동
	@GetMapping("/circle/MyCircleList")
	public String mycirclelist(Model model, Principal principal) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		List<MyCircleJoinVo> list = mservice.selectAllMyJoin(userMnum); //신청한동아리
		model.addAttribute("list", list);
		
		System.out.println("신청한 동아리 페이지로 이동");
		return "circle/MyCircleList";
	}
	
	//좋아요한 동아리 목록 페이지로 이동 //수정필요
	@GetMapping("/circle/MyCircleLike")
	public String mycirclelike(Model model, Principal principal) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		List<MyCircleJoinVo> list = mservice.selectAllMyJoin(userMnum); //신청한동아리
		List<CircleVo> mylist = cservice.selectMyCircle(userMnum);//내가만든동아리
		model.addAttribute("list", list);
		model.addAttribute("mylist", mylist);
		
		return "circle/MyCircleLike";
	}
	
	//동아리 관리 페이지 - 동아리 정보 수정
	@PostMapping("/circle/MyCircleUpdate1")
	public String mycircleupdate1(CircleVo vo, Model model, Principal principal, MultipartFile file1) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		model.addAttribute("uservo", uservo);
		model.addAttribute("userMnum", userMnum);
		
		List<CircleVo> mylist = cservice.selectMyCircle(userMnum);//내가만든동아리
		model.addAttribute("mylist", mylist);
		String path = sc.getRealPath("/resources/upload");
		System.out.println(path);
		String ci_logofile = file1.getOriginalFilename(); 
		try {
			InputStream is1 = file1.getInputStream(); 
			File f1=new File(path + "\\" + ci_logofile);
			System.out.println("동아리로고이미지:"+f1);
			FileOutputStream fos1=new FileOutputStream(path + "\\" + ci_logofile);
			FileCopyUtils.copy(is1, fos1);
			is1.close();
			fos1.close();
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("ci_name", vo.getCi_name());
			map.put("ci_category", vo.getCi_category());
			map.put("ci_person", vo.getCi_person());
			map.put("ci_logofile", ci_logofile);
			map.put("m_num", userMnum);
			cservice.updateC(map);
			
			model.addAttribute("result","success");
			System.out.println("동아리 정보 수정 완료!");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
			System.out.println("동아리 정보 수정 실패!");
		}
		
		return "redirect:/circle/MyCircle";
	}
	
	//동아리 관리 페이지 - 게시글 수정
	@PostMapping("/circle/MyCircleUpdate2")
	public String mycircleupdate2(CircleVo vo, Model model, Principal principal, MultipartFile file2) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		model.addAttribute("uservo", uservo);
		model.addAttribute("userMnum", userMnum);
		
		List<CircleVo> mylist = cservice.selectMyCircle(userMnum);//내가만든동아리
		model.addAttribute("mylist", mylist);
		String path = sc.getRealPath("/resources/upload");
		System.out.println(path);
		String ci_imgfile = file2.getOriginalFilename(); 
		try {
			InputStream is2 = file2.getInputStream(); 
			File f2=new File(path + "\\" + ci_imgfile);
			System.out.println("동아리로고이미지:"+f2);
			FileOutputStream fos2=new FileOutputStream(path + "\\" + ci_imgfile);
			FileCopyUtils.copy(is2, fos2);
			is2.close();
			fos2.close();

			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("ci_title", vo.getCi_title());
			map.put("ci_content", vo.getCi_content());
			System.out.println(vo.getCi_content());
			map.put("ci_imgfile", ci_imgfile);
			map.put("ci_startdate", vo.getCi_startdate());
			map.put("ci_enddate", vo.getCi_enddate());
			map.put("m_num", userMnum);
			cservice.updateB(map);
			
			model.addAttribute("result","success");
			System.out.println("게시글 수정 완료!");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
			System.out.println("게시글 수정 실패!");
		}
		
		return "redirect:/circle/MyCircle";
	}
	
	//동아리 관리 페이지 - 신청한 학생 목록 보기
	@GetMapping("/circle/CircleStudentList")
	public void circlestudentlist(int ci_num, Model model, Principal principal, HttpServletRequest request) {
		MemberVo uservo = cservice.selectM(principal.getName());
		
		int userMnum = uservo.getM_num();
		List<MyCircleJoinVo> list = mservice.selectAllMyJoin(userMnum); //신청한동아리
		List<CircleVo> mylist = cservice.selectMyCircle(userMnum);//내가만든동아리
		List<MyCircleListVo> studentlist = mservice.selectMyList(ci_num);
		
		//ci_num을 세션에 저장
		request.getSession().setAttribute("ci_num", ci_num);
		System.out.println("컨트롤러"+ci_num);
		
		model.addAttribute("list", list);
		model.addAttribute("mylist", mylist);
		model.addAttribute("studentlist", studentlist);
		
	}
}
