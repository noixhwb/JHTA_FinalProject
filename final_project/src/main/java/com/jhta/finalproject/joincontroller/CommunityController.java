package com.jhta.finalproject.joincontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.Principal;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.service.CommunityService;
import com.jhta.finalproject.service.MemberService;
import com.jhta.finalproject.vo.BoardVo;
import com.jhta.finalproject.vo.BoardimgVo;
import com.jhta.finalproject.vo.CommentsVo;
import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.MemberVo;
import com.jhta.finalproject.vo.MyCommunityVo;
import com.util.PageUtil;


@Controller
	public class CommunityController {
	@Autowired CommunityService service;
	
	@Autowired private ServletContext sc;
	
	
	@GetMapping("/community/communityInsertForm")//커뮤니티 게시요청 폼
	public String insertForm(Principal principal,Model model) {
		MemberVo vo=service.selectUser(principal.getName());
		
		model.addAttribute("vo",vo);  
		System.out.println(vo);
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
			FileOutputStream fos1=new FileOutputStream(path + "\\" + cu_coverimg );
			FileCopyUtils.copy(is1, fos1);
		
			is1.close();
		
			fos1.close();
			

			MemberVo vo1 = service.selectUser(principal.getName());
			int mnum = vo1.getM_num();
			model.addAttribute("mvo", vo1);
			model.addAttribute("mnum", mnum);
			service.insertcm(new CommunityVo(0, vo.getCu_name(), vo.getCu_intro(),vo.getCu_category(), vo.getCu_notice(), vo.getCu_recommend(), cu_coverimg, mnum, vo.getCu_status()));
			service.insertmyc(new MyCommunityVo(0,service.lastnum(), mnum));
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
	public String communitylist(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
			String keyword,
			String field,
			Model model) {
		System.out.println("커뮤니티 페이지");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword", keyword);
			
		
		int totalRowCount = service.getCount(map);
		PageUtil pu=new PageUtil(pageNum, 5, 10, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow(); 
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<CommunityVo> list = service.selectAll(map);
		model.addAttribute("field",field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		return "community/communityList";
	}
	
	@GetMapping("/community/communitydetail")
	public String communitydetail(int cu_num,Model model,Principal principal ) {
		MemberVo vo=service.selectUser(principal.getName());
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<BoardVo> list1 = service.selectAllboard(cu_num);
		
		
		
		model.addAttribute("vo",vo);
		System.out.println(vo);
		CommunityVo vo1=service.select(cu_num);
		model.addAttribute("vo1",vo1);
		System.out.println(vo1);
		System.out.println(list1.isEmpty());
		model.addAttribute("list1", list1);
		return "community/communitydetail";
	}
	
	@GetMapping("/board/boarddetail")
	public String boarddetail(int b_num, Model model) {

		BoardVo bvo = service.detail(b_num);
		BoardimgVo bivo =(BoardimgVo) service.selectAllboardimg(b_num);
		List<CommentsVo> list1 = service.selectcommentall(b_num);
		
		
		int viewnumber =service.addHit(b_num);
		String content = bvo.getB_content().replaceAll("\n", "<br>");
		bvo.setB_content(content);
		model.addAttribute("viewnumber", viewnumber);
		model.addAttribute("vo", bvo);
		model.addAttribute("vo1", bivo);
		model.addAttribute("list1", list1);
		System.out.println(bvo);
		System.out.println(bivo);
		return "board/boarddetail";
	}
	
	
	

	
	@GetMapping("/board/boardinsertform")
	public String boardform(Principal principal,Model model,int cu_num) {
		MemberVo vo=service.selectUser(principal.getName());
		model.addAttribute("vo",vo);
		System.out.println(vo);
		CommunityVo vo1=service.select(cu_num);
		model.addAttribute("vo1",vo1);
		System.out.println(vo1);
		
		return "board/boardinsertform";
	}
	
	@PostMapping("/board/boardinsert")
	public String boardinsert(BoardVo bvo ,MultipartFile file1, Model model,int cu_num) {
		String path = sc.getRealPath("/resources/comm");
		System.out.println(bvo.getM_num() + " // " + bvo.getCu_num() + " // " + bvo.getB_title());
		model.addAttribute("cu_num", cu_num);
		String i_filename  = file1.getOriginalFilename(); 
		try {
			InputStream is1 = file1.getInputStream(); 
			File f1=new File(path + "\\" + i_filename );
			System.out.println("게시판사진"+f1);
			FileOutputStream fos1=new FileOutputStream(path + "\\" + i_filename );
			FileCopyUtils.copy(is1, fos1);
		
			is1.close();
		
			fos1.close();
			int succ = 0;
			succ = service.insertBoard(bvo);
			if(succ == 1) {
				BoardimgVo bivo = new BoardimgVo();
				bivo.setI_filename(i_filename);
				succ = service.insertBoardImg(bivo);
			}else {
				return "redirect:/community/communitydetail?"+	cu_num;
			}
			
			System.out.println("성공");
		}catch(Exception e) {
			e.printStackTrace();
			
			System.out.println("실패");
		}
		return "redirect:/community/communitydetail?"+cu_num;
	}
	@PostMapping("/comments/commentsinsert")
	public String commentsform(Model model,CommentsVo cvo ,int b_num) {
		service.insertcomments(cvo);
		System.out.println("실행");
//		MemberVo vo=service.selectUser(principal.getName());
//		model.addAttribute("vo",vo);
//	
//		BoardVo bvo = service.detail(b_num);
//		model.addAttribute("vo1",bvo);
		model.addAttribute("b_num", b_num);
		return "redirect:/board/boarddetail?"+b_num;
	}

	
	@PostMapping("community/update")
	public String update(CommunityVo vo,Model model) {
		
		
		service.updatecc(vo);
		return "redirect:/community/mycommunity";
	} 
	
	@GetMapping("community/removeCommunity")
	public String removeCommunity(int cu_num) {
		//cu_num으로 board b_num전부 검색
		List<BoardVo> vo= service.selectBoard2(cu_num);
		
		for(BoardVo list:vo) {
			// b_num 리스트로 comments 반복 삭제
			service.removeComments2(list.getB_num());
			// b_num 리스트로 board이미지 반복삭제
			service.removeBoardimg(list.getB_num());
			// b_num 리스트로 board 반복삭제
			service.removeBoard(list.getB_num());
		}
		
		//cu_num으로 Community삭제
		service.removeCommunity(cu_num);
		return "";
	}
	@GetMapping("community/removeBoard")
	public String removeBoard(int b_num) {
		//b_num 으로 comments 삭제
		service.removeComments2(b_num);
		//b_num으로 board이미지 삭제
		service.removeBoardimg(b_num);
		//b_num으로 board 삭제
		service.removeBoard(b_num);
		return "";
	}
	@GetMapping("community/removeComments")
	public String removeComments(int co_num) {
		//co_num으로 댓글만 삭제
		service.removeComments(co_num);
		return "";
	}
	
	

	
	
}
	


	
	

	
