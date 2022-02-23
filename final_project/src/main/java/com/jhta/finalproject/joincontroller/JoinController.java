package com.jhta.finalproject.joincontroller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.vo.MemberVo;


@Controller
public class JoinController {
	
	
	@Autowired private MemberService service;
	@Autowired private JavaMailSender mailSender;
	private Logger log=LoggerFactory.getLogger(JoinController.class);
	@GetMapping("/join")
	public String joinForm() {
		System.out.println("컨트롤러작동중");
		
		return "/join";
	}
	@PostMapping("/join")
	public String join(MemberVo vo) {     
		service.addUser(vo);
		return "redirect:/home";
		
	}
	
	@GetMapping(value="/isMember",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> isMember(String mid){
		MemberVo vo=service.isMember(mid);
		log.info("조인");
		System.out.println("컨트롤러작동중3");
		HashMap<String,Object> map=new HashMap<String, Object>();
		if(vo!=null) {
			map.put("using",true);
		}else {
			map.put("using",false);
		}
		return map;
	}

	@GetMapping(value="/isNick",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> isNick(String mnick){
		MemberVo vo=service.isNick(mnick);
		log.info("닉네임");
		HashMap<String,Object> map=new HashMap<String, Object>();
		if(vo!=null) {
			map.put("using",true);
		}else {
			map.put("using",false);
		} 
		return map;
		
}

	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
		
		log.info("이메일데이터 전송확인");
		log.info(email);
		
		//난수생성
		 Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        log.info("인증번호 " + checkNum);
	        
	        String setFrom = "shh2659@naver.com";
	        String toMail = email;
	        String title = "**대학교 캠퍼스픽";
	        String content = 
	                "안녕하세요~~~~ **대학교 캠퍼스픽입니다!!!!" +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + " 입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 정확하게 기입하여 주세요.";
	        
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
		String num = Integer.toString(checkNum);
		return num;
    }
	
}

	


	

