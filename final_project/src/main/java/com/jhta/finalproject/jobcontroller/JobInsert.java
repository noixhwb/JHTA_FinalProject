package com.jhta.finalproject.jobcontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.finalproject.service.JobService;
import com.jhta.finalproject.vo.JobVo;

@Controller
public class JobInsert {
	@Autowired private ServletContext sc;
	@Autowired private JobService service;
	
	@GetMapping("/job/insert")
	public String insertForm() {
		return "job/insertForm";
	}
	
	@PostMapping("/job/insert")
	public String insert(JobVo vo, MultipartFile file1, MultipartFile file2, Model model) {
		String path=sc.getRealPath("/resources/upload");
		String orgfilname=file1.getOriginalFilename();
		String savefilename=UUID.randomUUID() + "_" + orgfilname;
		try {
			InputStream is=file1.getInputStream();
			File f=new File(path + "\\" + savefilename);
			FileOutputStream fos=new FileOutputStream(path + "\\" + savefilename);
			FileCopyUtils.copy(is, fos);
			long filesize=file1.getSize();
			is.close();
			fos.close();
			service.insert(vo);
//			service.insert(new FileInfoVo(0, writer, title, content, orgfilename, savefilename, filesize));
			model.addAttribute("result","fail");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
		}
		return "job/result";
	}
}
