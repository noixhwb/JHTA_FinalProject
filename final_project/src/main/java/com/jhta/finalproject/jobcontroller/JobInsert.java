package com.jhta.finalproject.jobcontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.finalproject.jobvo.CareerVo;
import com.jhta.finalproject.jobvo.DutyVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.jobvo.ZoneVo;
import com.jhta.finalproject.service.CareerService;
import com.jhta.finalproject.service.DutyService;
import com.jhta.finalproject.service.JobService;
import com.jhta.finalproject.service.ZoneService;

@Controller
public class JobInsert {
	@Autowired private ServletContext sc;
	@Autowired private JobService Jservice;
	@Autowired private ZoneService Zservice;
	@Autowired private DutyService Dservice;
	@Autowired private CareerService Cservice;
	
	@GetMapping("/job/insert")
	public String insertForm() {
		return "job/insertForm";
	}
	
	@PostMapping("/job/insert")
	// file1=j_img, file2=j_infoimg
	public String insert(JobVo vo, ZoneVo zone, DutyVo duty, CareerVo career,
						MultipartFile file1, MultipartFile file2, 
						Model model) {
		String path=sc.getRealPath("/resources/upload");
		System.out.println(path);
		String logoImg=file1.getOriginalFilename(); // 전송된 기업로고 파일명
		String infoImg=file1.getOriginalFilename(); // 전송된 채용공고 파일명
		try {
			// 파일업로드 하기
			InputStream is1=file1.getInputStream(); 
			InputStream is2=file1.getInputStream(); 
			File f1=new File(path + "\\" + logoImg);
			File f2=new File(path + "\\" + infoImg);
			FileOutputStream fos1=new FileOutputStream(path + "\\" + logoImg);
			FileOutputStream fos2=new FileOutputStream(path + "\\" + infoImg);
			FileCopyUtils.copy(is1, fos1);
			FileCopyUtils.copy(is2, fos2);
			is1.close();
			is2.close();
			fos1.close();
			fos2.close();
			
			//db에 저장하기
			Jservice.insert(new JobVo(0, vo.getJ_company(), vo.getJ_subject(), vo.getJ_startdate(),
							vo.getJ_enddate(), 0, vo.getJ_url(), logoImg, infoImg));
			Zservice.insert(new ZoneVo(0, 0, zone.getJz_zone()));
			Dservice.insert(new DutyVo(0, 0, duty.getJd_duty()));
			Cservice.insert(new CareerVo(0, 0, career.getJc_career()));
			model.addAttribute("result","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
		}
//		try {
//			URL url= new URL("https://gate.nicednb.com/nice/bizinfo/v1.0/enterprise/general/search");
//			// HttpURLConnection : 서버와 클라를 연결해주는 역할
//			HttpURLConnection 서버연결 = (HttpURLConnection) url.openConnection();
//			서버연결.setRequestMethod("POST");
//			서버연결.setRequestProperty("Authorization", "Bearer a73d1418-e9bc-4ef4-a60c-f59406413bf6");
//			서버연결.setRequestProperty("Content-Type", "application/json");
//			서버연결.setDoOutput(true);
//			
//		//	String 파라미터 = "searchName=CMP_NM&serarchValue="; ... 여기서부터 모르겠다아아
//		} catch (MalformedURLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		return "job/result";
	}
}
