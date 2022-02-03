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
import com.jhta.finalproject.jobvo.CareerVo;
import com.jhta.finalproject.jobvo.DutyVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.jobvo.ZoneVo;
import com.jhta.finalproject.service.CircleService;
import com.jhta.finalproject.vo.MemberVo;

@Controller
public class CircleInsertController {
	//동아리 + 게시글 등록 페이지로 이동
	@Autowired private CircleService service;
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
		
		return "circle/CircleInsertForm";
	}
	
	@PostMapping("/circle/CircleInsert")
	public String circleinsertok(CircleVo vo, MultipartFile file1, MultipartFile file2, Model model, Principal principal) {
		String path = sc.getRealPath("/resources/upload");
		System.out.println(path);
		String ci_logofile = file1.getOriginalFilename(); 
		String ci_imgfile = file2.getOriginalFilename(); 
		try {
			InputStream is1 = file1.getInputStream(); 
			InputStream is2 = file2.getInputStream(); 
			File f1=new File(path + "\\" + ci_logofile);
			File f2=new File(path + "\\" + ci_imgfile);
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
			model.addAttribute("result","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
		}
		return "circle/CircleInsertOk";
	}
}
