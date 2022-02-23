package com.jhta.finalproject.circlecontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.Member;
import java.security.Principal;
import java.sql.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.circlevo.MyCircleVo;
import com.jhta.finalproject.jobvo.CareerVo;
import com.jhta.finalproject.jobvo.DutyVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.jobvo.ZoneVo;
import com.jhta.finalproject.service.CircleService;
import com.jhta.finalproject.service.MyCircleService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class CircleInsertController {
	//동아리 + 게시글 등록 페이지로 이동
	@Autowired private CircleService service;
	@Autowired private MyCircleService mservice;
	@Autowired private ServletContext sc;
	
	@GetMapping("/circle/CircleInsert")
	public String circleinsert(Model model, Principal principal) {
		MemberVo uservo = service.selectM(principal.getName());
		int userMnum = uservo.getM_num();
		String userMname = uservo.getM_name();
		String userMnickname = uservo.getM_nickname();
		model.addAttribute("uservo", uservo);
		model.addAttribute("userMnum", userMnum);
		model.addAttribute("userMname", userMname);
		model.addAttribute("userMnickname", userMnickname);
		System.out.println("동아리+게시글 등록 페이지로 이동");
		return "circle/CircleInsertForm";
	}
	
	@PostMapping("/circle/CircleInsert")
	public String circleinsertok(CircleVo vo, MultipartFile file1, MultipartFile file2, Model model, Principal principal) {
		String path = sc.getRealPath("/resources/images/circle");
		System.out.println(path);
		String ci_logofile="";
		String ci_imgfile="";
		if (!file1.isEmpty()) {
			ci_logofile = file1.getOriginalFilename();
		} else {
			ci_logofile = "club.png";
		}
		if (!file2.isEmpty()) {
			ci_imgfile = file2.getOriginalFilename();
		} else {
			ci_imgfile = "poster.png";
		}
		 
		
		try {
			InputStream is1 = file1.getInputStream(); 
			InputStream is2 = file2.getInputStream(); 
			File f1=new File(path + "\\" + ci_logofile);
			File f2=new File(path + "\\" + ci_imgfile);
			System.out.println("file1:"+file1);
			System.out.println("ci_logofile:"+ci_logofile);
			System.out.println("동아리로고이미지:"+f1);
			System.out.println("동아리게시글이미지:"+f2);
			FileOutputStream fos1=new FileOutputStream(path + "\\" + ci_logofile);
			FileOutputStream fos2=new FileOutputStream(path + "\\" + ci_imgfile);
			FileCopyUtils.copy(is1, fos1);
			FileCopyUtils.copy(is2, fos2);
			is1.close();
			is2.close();
			fos1.close();
			fos2.close();

			MemberVo uservo = service.selectM(principal.getName());
			int userMnum = uservo.getM_num();
			model.addAttribute("uservo", uservo);
			model.addAttribute("userMnum", userMnum);
			service.insert(new CircleVo(0, vo.getCi_name(), vo.getCi_category(), 
							vo.getCi_person(), ci_logofile, userMnum, 0, 
							0, vo.getCi_title(), vo.getCi_content(), ci_imgfile,
							vo.getCi_startdate(), vo.getCi_enddate(), vo.getCi_view(), vo.getCi_recommend()));
			//mservice.insert(new MyCircleVo(0, vo.getCi_num(), userMnum));
			model.addAttribute("result","success");
			System.out.println("동아리+게시글 등록 완료!");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
			System.out.println("동아리+게시글 등록 실패!");
		}
		return "circle/CircleInsertOk";
	}
}
