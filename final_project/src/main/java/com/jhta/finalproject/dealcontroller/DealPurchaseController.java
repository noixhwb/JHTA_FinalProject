package com.jhta.finalproject.dealcontroller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.service.DealService;

@Controller
public class DealPurchaseController {
	@Autowired DealService service;
	@GetMapping("/deal/dealpurchase")
	public String purchaseform(int t_num,String m_id,Model model, Principal principal) {
		//구매자 정보 로그인한 아이디 기반으로 찾음
		model.addAttribute("pvo",service.selectMember(principal.getName()));
		//판매자 정보 m_id 기반으로 찾음
		model.addAttribute("svo",service.selectMember(principal.getName()));
		//상품 정보 t_num 기반으로 찾음
		model.addAttribute("dvo",service.selectOne(t_num));
		//상품 이미지 t_num 기반으로 찾음
		model.addAttribute("imglist",service.selectImg(t_num));
		return "deal/dealpurchase";
	}
	
	
	
	@RequestMapping("/pay.cls")
	public String serve(String pg_token) {
		try {
			System.out.println(pg_token);
			URL addr = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection con;
			con = (HttpURLConnection)addr.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK ab24dd1e4290f735003b002390ea1231");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			String param = "cid=TC0ONETIME"
					+ "&tid=T0000000001425493797"
					+ "&partner_order_id=partner_order_id"
					+ "&partner_user_id=partner_user_id"
					+ "&pg_token="+pg_token;
			OutputStream ops = con.getOutputStream();
			DataOutputStream dos = new DataOutputStream(ops);
			dos.writeBytes(param);
			dos.close();
			int result = con.getResponseCode();
			InputStream ips;
			if (result == 200) {
				ips = con.getInputStream();
			} else {
				ips = con.getErrorStream();
			}
			InputStreamReader isr = new InputStreamReader(ips);
			BufferedReader bfr = new BufferedReader(isr);
			System.out.println(bfr.readLine());
		}catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:deal/deallist";
	}
}
