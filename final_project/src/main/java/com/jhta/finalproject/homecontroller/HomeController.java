package com.jhta.finalproject.homecontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.service.DealService;
import com.jhta.finalproject.service.HomeService;
import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.DealVo;
import com.jhta.finalproject.vo.Goods_ImageVo;

@Controller
public class HomeController {
	@Autowired
	ServletContext sc;
	@Autowired
	HomeService service;
	@Autowired
	private DealService d_service;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		sc.setAttribute("cp", sc.getContextPath());

		List<CommunityVo> communitylist = service.communityList();
		List<CircleVo> circlelist = service.circleList();

		List<DealVo> deallist = service.dealList();
		List<Goods_ImageVo> dealimglist = new ArrayList<Goods_ImageVo>();
		for (DealVo li : deallist) {
			List<Goods_ImageVo> img = d_service.selectImg(li.getT_num());
			dealimglist.add(img.get(0));
		}
		System.out.println(dealimglist);
		System.out.println(deallist);
		model.addAttribute("deallist", deallist);
		model.addAttribute("dealimglist", dealimglist);

		List<JobVo> jobinfolist = service.jobinfoList();
		model.addAttribute("communitylist", communitylist);
		model.addAttribute("circlelist", circlelist);
		model.addAttribute("jobinfolist", jobinfolist);
		return "home";
	}

}
