package com.jhta.finalproject.joincontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.vo.MemberVo;



@Controller
public class FindpwdController {

	private Logger log=LoggerFactory.getLogger(FindpwdController.class);
	@Autowired private MemberService service;
	@Autowired private JavaMailSender mailSender;
	@Autowired PasswordEncoder pwdEncoder;
	
	@GetMapping("/member/findPwd")
	public String findPwdForm() {
		
		System.out.println("비밀번호찾기폼인");
		
		return "member/findPwdForm";
	}
	
	@PostMapping("/member/findPwd")
	public ModelAndView pwdMail(HttpServletRequest request, String m_id, String m_email, HttpServletResponse response_email) throws IOException{
		MemberVo vo=service.findPwdChk(m_id, m_email);
		ModelAndView mv = new ModelAndView();
		
		if(vo!=null) {	
			
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			System.out.println("dice : " + checkNum); //체크
			vo.setM_pwd(pwdEncoder.encode(Integer.toString(checkNum)));	//생성된 난수로 비밀번호 설정 & encoding
			System.out.println(vo.getM_pwd()); //체크용
			service.findPwd(vo);
			
			String setFrom ="shh2659@naver.com";
			String toMail = request.getParameter("m_email");
			String title = "비밀번호 변경 이메일입니다.";
			String content =
				"안녕하세요~~~~ **대학교 캠퍼스픽입니다!!!!" +
				"<br><br>" + 
			 	" 새로운 비밀번호는 " + checkNum +  " 입니다. "+ 
			 	"<br>" + 
			 	"<br>" + 
	            "변경된 비밀번호로 로그인 해주세요."; 
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				
				mailSender.send(message);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
					
			mv.setViewName("member/findPwdForm");
			mv.addObject("resultMsg", "이메일이 발송되었습니다");
	        
	        System.out.println("mv : "+mv);
	
	        response_email.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_email = response_email.getWriter();
	        out_email.println("<script>alert('이메일이 발송되었습니다. 이메일을 확인해주세요.');location.href='http://localhost:9090/finalproject/login';</script>");
	        out_email.flush();
	        System.out.println(checkNum);
	       
	       
		}
		else {
			mv.setViewName("member/findPwdForm");
			mv.addObject("resultMsg", "조회된 정보가 없습니다");
		}
		return mv;	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
	
//	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
//	public void findPwPOST(@ModelAttribute MemberVo member, HttpServletResponse response) throws Exception{
//		service.findPwdChk(response, member);
//	}
//}
//	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@PostMapping("/member/findPwd")
//	public ModelAndView pwdMail(HttpServletRequest request, String m_id, String m_email, HttpServletResponse response_email) throws IOException{
//		
//		ModelAndView mv = new ModelAndView();
//		MemberVo n=service.findPwdChk(m_id, m_email);
//		if(n!=null) {	
//			
//			Random random = new Random();
//			int checkNum = random.nextInt(888888) + 111111;
//			System.out.println(m_id);
//			System.out.println(m_email); 
//			log.info(m_id);
//			log.info(m_email);
//			MemberVo vo=new MemberVo();
//			vo.setM_pwd(pwdEncoder.encode(Integer.toString(checkNum)));	
//			service.findPwd(vo);
//			System.out.println(vo.getM_pwd()); 
//			
//			String setFrom ="shh2659@naver.com";
//			String toMail = request.getParameter("email");
//			String title = "비밀번호 변경 이메일입니다.";
//			String content =
//			 	" 새로운 비밀번호는 " +checkNum+ " 입니다. "
//	            +System.getProperty("line.separator")
//	            +System.getProperty("line.separator")
//	            +"변경된 비밀번호로 로그인 해주세요."; 
//			
//			try {
//				MimeMessage message = mailSender.createMimeMessage();
//				MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"utf-8");
//				
//				messageHelper.setFrom(setFrom);
//				messageHelper.setTo(toMail);
//				messageHelper.setSubject(title);
//				messageHelper.setText(content);
//				
//				mailSender.send(message);
//				
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//					
//			mv.setViewName("member/findpwd");
//			mv.addObject("resultMsg", "이메일이 발송되었습니다");
//	        
//	        System.out.println("mv : "+mv);
//	
//	        response_email.setContentType("text/html; charset=UTF-8");
//	        PrintWriter out_email = response_email.getWriter();
//	        out_email.println("<script>alert('이메일이 발송되었습니다. 이메일을 확인해주세요.');</script>");
//	        out_email.flush();
//        
//		}
//		else {
//			mv.setViewName("member/findpwd");
//			mv.addObject("resultMsg", "조회된 정보가 없습니다");
//			System.out.println(m_id);
//			System.out.println(m_email); //체크용
//			log.info(m_id);
//			log.info(m_email);
//			
//		}
//		return mv;	
//	}
	



////	@RequestMapping(value="/member/find_password", method=RequestMethod.POST)
//	@PostMapping("/member/findpwd")
//	public String findPasswordAction(MemberVo vo, Model model) {
//		MemberVo member = service.findPassword(vo);
//		System.out.println("회원아이디이메일조회");
//		if(member == null) { 
//			model.addAttribute("check", 1);
//		} else { 
//			model.addAttribute("check", 0);
//			model.addAttribute("updateid", member.getM_id());
//		}
//		
//		return "member/findpwd";
//	}
//	
//    // 비밀번호 바꾸기 실행
//	//@RequestMapping(value="update_password", method=RequestMethod.POST)
//	@PostMapping("/member/update_password")
//	public String updatePasswordAction(@RequestParam(value="updateid", defaultValue="", required=false) String id,
//										MemberVo vo) {
//		
//		System.out.println(id);
//		
//		service.updatePassword(vo);
//		return "member/findPasswordConfirm";
//	}
//	
//    // 비밀번호 바꾸기할 경우 성공 페이지 이동
//	@RequestMapping(value="check_password_view")
//	public String checkPasswordForModify(HttpSession session, Model model) {
//		MemberVo loginUser = (MemberVo) session.getAttribute("loginUser");
//		
//		if(loginUser == null) {
//			return "member/login";
//		} else {
//			return "mypage/checkformodify";
//		}
//	}
//}

