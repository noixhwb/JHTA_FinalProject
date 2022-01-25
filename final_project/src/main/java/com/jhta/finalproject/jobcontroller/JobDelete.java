package com.jhta.finalproject.jobcontroller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.service.CareerService;
import com.jhta.finalproject.service.DutyService;
import com.jhta.finalproject.service.JobService;
import com.jhta.finalproject.service.ZoneService;

@Controller
public class JobDelete {
	@Autowired private ServletContext sc;
	@Autowired private JobService Jservice;
	@Autowired private ZoneService Zservice;
	@Autowired private DutyService Dservice;
	@Autowired private CareerService Cservice;
	
	@GetMapping("/job/delete")
	public String delete(int j_num, Model model) {
		try{
			Zservice.delete(j_num);
			Dservice.delete(j_num);
			Cservice.delete(j_num);
			
			JobVo vo = Jservice.selectOne(j_num);
			String path = sc.getRealPath("/resources/upload");
			File f1=new File(path + "\\" + vo.getJ_img());
			File f2=new File(path + "\\" + vo.getJ_infoimg());
			
			Jservice.delete(j_num);
			if(f1.exists()) f1.delete();
			if(f2.exists()) f2.delete();
			
			model.addAttribute("result","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
		}
		return "job/result";
	}
}
