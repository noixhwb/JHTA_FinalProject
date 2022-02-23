package com.jhta.finalproject.circlecontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.Principal;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.finalproject.circlevo.CircleListJoinVo;
import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.circlevo.LikeCircleJoinVo;
import com.jhta.finalproject.circlevo.LikeCircleVo;
import com.jhta.finalproject.circlevo.MyCircleJoinVo;
import com.jhta.finalproject.circlevo.MyCircleListVo;
import com.jhta.finalproject.service.CircleAdminService;
import com.jhta.finalproject.service.CircleService;
import com.jhta.finalproject.service.LikeCircleService;
import com.jhta.finalproject.service.MyCircleService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class MyCircleController {
	//내 동아리 페이지로 이동
	@Autowired private MyCircleService mservice;
	@Autowired private CircleService cservice;
	@Autowired private LikeCircleService lservice;
	@Autowired private ServletContext sc;
	@Autowired private CircleAdminService caservice;
	
	//동아리 관리 페이지로 이동
	@GetMapping("/circle/MyCircle")
	public String mycircle(String name, String keyword, 
						   Model model, Principal principal,HttpServletRequest request) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("keyword", keyword);
		map.put("m_num", userMnum);
		List<CircleVo> mylist = cservice.selectMyCircle(map);//내가만든동아리
		
		mylist = cservice.selectMyCircle(map);//내가만든동아리
		model.addAttribute("mylist", mylist);
		System.out.println("내 동아리 관리 페이지로 이동"+mylist);
		return "circle/MyCircle";
	}
	
	//신청한 동아리 목록 페이지로 이동
	@GetMapping("/circle/MyCircleList")
	public String mycirclelist(String name, String keyword, Model model, Principal principal) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("keyword", keyword);
		map.put("m_num", userMnum);
		List<MyCircleJoinVo> list = mservice.selectAllMyJoin(map); //신청한동아리
		model.addAttribute("list", list);
		
		System.out.println("신청한 동아리 페이지로 이동");
		return "circle/MyCircleList";
	}
	
	//좋아요한 동아리 목록 페이지로 이동 
	@GetMapping("/circle/MyCircleLike")
	public String mycirclelike(String name, String keyword, Model model, Principal principal) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("keyword", keyword);
		map.put("m_num", userMnum);
		List<LikeCircleJoinVo> mylikelist = lservice.selectMyLikeList(map);
		model.addAttribute("mylikelist", mylikelist);
		
		return "circle/MyCircleLike";
	}
	
	//동아리 관리 페이지 - 동아리 정보 수정
	@PostMapping("/circle/MyCircleUpdate1")
	public String mycircleupdate1(String name, String keyword, CircleVo vo, Model model, Principal principal, MultipartFile file1) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		
		
		model.addAttribute("uservo", uservo);
		model.addAttribute("userMnum", userMnum);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("keyword", keyword);
		map.put("m_num", userMnum);
		List<CircleVo> mylist = cservice.selectMyCircle(map);
		model.addAttribute("mylist", mylist);
		/* 파일을 삭제하고 수정해야하는데.. 이부분은...ㅠ
		try {
			if (!file1.isEmpty()) {
				String path = sc.getRealPath("/resources/upload");
				System.out.println(path);
				String ci_logofile = file1.getOriginalFilename(); 
				InputStream is1 = file1.getInputStream(); 
				File f1=new File(path + "\\" + ci_logofile);
				System.out.println("동아리로고이미지:"+f1);
				FileOutputStream fos1=new FileOutputStream(path + "\\" + ci_logofile);
				FileCopyUtils.copy(is1, fos1);
				is1.close();
				fos1.close();
				
				//기존파일 삭제
				
				
				//DB에 새로운 정보로 수정
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("ci_name", vo.getCi_name());
				map.put("ci_category", vo.getCi_category());
				map.put("ci_person", vo.getCi_person());
				map.put("ci_logofile", ci_logofile);
				map.put("m_num", userMnum);
				cservice.updateC(map);
				
				model.addAttribute("result","success");
				System.out.println("동아리 정보 수정 완료!");
			}
		}
		*/
		String path = sc.getRealPath("/resources/images/circle");
		System.out.println(path);
		String ci_logofile="";
		if (!file1.isEmpty()) {
			ci_logofile = file1.getOriginalFilename();
		} else {
			ci_logofile = "club.png";
		}
		try {
			InputStream is1 = file1.getInputStream(); 
			File f1=new File(path + "\\" + ci_logofile);
			System.out.println("동아리로고이미지:"+f1);
			FileOutputStream fos1=new FileOutputStream(path + "\\" + ci_logofile);
			FileCopyUtils.copy(is1, fos1);
			is1.close();
			fos1.close();
			
			HashMap<String, Object> map1=new HashMap<String, Object>();
			map1.put("ci_name", vo.getCi_name());
			map1.put("ci_category", vo.getCi_category());
			map1.put("ci_person", vo.getCi_person());
			map1.put("ci_logofile", ci_logofile);
			map1.put("m_num", userMnum);
			cservice.updateC(map1);
			
			model.addAttribute("result","success");
			System.out.println("동아리 정보 수정 완료!");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
			System.out.println("동아리 정보 수정 실패!");
		}
		
		return "redirect:/circle/MyCircle?name=ci_ok&keyword=1";
	}
	
	//동아리 관리 페이지 - 게시글 수정
	@PostMapping("/circle/MyCircleUpdate2")
	public String mycircleupdate2(String name, String keyword, CircleVo vo, Model model, Principal principal, MultipartFile file2) {
		MemberVo uservo = cservice.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		model.addAttribute("uservo", uservo);
		model.addAttribute("userMnum", userMnum);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("keyword", keyword);
		map.put("m_num", userMnum);
		List<CircleVo> mylist = cservice.selectMyCircle(map);
		model.addAttribute("mylist", mylist);
		String path = sc.getRealPath("/resources/images/circle");
		System.out.println(path);
		String ci_imgfile="";
		if (!file2.isEmpty()) {
			ci_imgfile = file2.getOriginalFilename();
		} else {
			ci_imgfile = "poster.png";
		}
		try {
			InputStream is2 = file2.getInputStream(); 
			File f2=new File(path + "\\" + ci_imgfile);
			System.out.println("동아리로고이미지:"+f2);
			FileOutputStream fos2=new FileOutputStream(path + "\\" + ci_imgfile);
			FileCopyUtils.copy(is2, fos2);
			is2.close();
			fos2.close();

			HashMap<String, Object> map2=new HashMap<String, Object>();
			map2.put("ci_title", vo.getCi_title());
			map2.put("ci_content", vo.getCi_content());
			System.out.println(vo.getCi_content());
			map2.put("ci_imgfile", ci_imgfile);
			map2.put("ci_startdate", vo.getCi_startdate());
			map2.put("ci_enddate", vo.getCi_enddate());
			map2.put("m_num", userMnum);
			cservice.updateB(map2);
			
			model.addAttribute("result","success");
			System.out.println("게시글 수정 완료!");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
			System.out.println("게시글 수정 실패!");
		}
		
		return "redirect:/circle/MyCircle?name=ci_ok&keyword=1";
	}
	
	//동아리 관리 페이지 - 신청한 학생 목록 보기
	@GetMapping("/circle/CircleStudentList")
	public @ResponseBody List<MyCircleListVo> circlestudentlist(int ci_num, Model model, Principal principal, HttpServletRequest request) {
		List<MyCircleListVo> studentlist = mservice.selectMyList(ci_num);
		
		System.out.println("동아리 신청한 학생 목록 불러오기 완료!");
		return studentlist;
	}
	
	//동아리 관리 페이지 - 거절된 동아리 확인 & DB삭제
	@PostMapping("/circle/rejectCircleDB")
	public String rejectCircleDB(int ci_num, Model model){
		caservice.rejectCircle(ci_num);
		
		System.out.println("거절 완료!"+ci_num);
		return "redirect:/circle/MyCircle?name=ci_ok&keyword=0";
	}
}
