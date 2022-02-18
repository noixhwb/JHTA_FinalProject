package com.jhta.finalproject.dealcontroller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.service.DealService;
import com.jhta.finalproject.vo.Purchase_infoVo;

@Controller
public class DealPurchaseController {
	@Autowired
	DealService service;

	@GetMapping("/deal/dealpurchase")
	public String purchaseform(int t_num, Model model, Principal principal, HttpServletRequest request) {
		// 구매자 정보 로그인한 아이디 기반으로 찾음
		model.addAttribute("pvo", service.selectMember(principal.getName()));
		// 판매자 정보 m_id 기반으로 찾음
		model.addAttribute("svo", service.selectMember(service.selectOne(t_num).getM_id()));
		// 상품 정보 t_num 기반으로 찾음
		model.addAttribute("dvo", service.selectOne(t_num));
		// 상품 이미지 t_num 기반으로 찾음
		model.addAttribute("imglist", service.selectImg(t_num));
		// t_num을 세션에 저장
		request.getSession().setAttribute("t_num", t_num);
		return "deal/dealpurchase";
	}

	@RequestMapping("/pay.cls")
	public String serve(String pg_token, HttpServletRequest request, Principal principal) {
		try {
			System.out.println(pg_token);
			URL addr = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection con;
			con = (HttpURLConnection) addr.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK ab24dd1e4290f735003b002390ea1231");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			String param = "cid=TC0ONETIME" + "&tid=" + request.getSession().getAttribute("tid")
					+ "&partner_order_id=partner_order_id" + "&partner_user_id=partner_user_id" + "&pg_token="
					+ pg_token;
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
			String result1 = bfr.readLine();
			JSONParser jsonpaser = new JSONParser();

			JSONObject json2 = (JSONObject) jsonpaser.parse(result1);
			String aid = (String) json2.get("aid");
			String tid = (String) json2.get("tid");
			String cid = (String) json2.get("cid");
			int t_num = (Integer) request.getSession().getAttribute("t_num");
			String pi_address = (String) request.getSession().getAttribute("pi_address");
			String pi_phone = (String) request.getSession().getAttribute("pi_phone");
			String pi_name = (String) request.getSession().getAttribute("pi_name");
			String request1 = (String) request.getSession().getAttribute("request1");
			System.out.println("request" + request1);
			System.out.println("phone" + pi_phone);

			Purchase_infoVo vo2 = new Purchase_infoVo(0, pi_address, pi_phone, pi_name, t_num,
					service.selectMember(principal.getName()).getM_num(), request1,aid,tid,cid);
			service.insert_pi(vo2);
			service.update_deal(t_num);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:deal/deallist";
	}

	@GetMapping("/deal/refund")
	public String refund(int t_num) {
		System.out.println(t_num);
		try {
			Purchase_infoVo vo= service.select_pi2(t_num);
			URL addr;

			addr = new URL("https://kapi.kakao.com/v1/payment/cancel");

			HttpURLConnection con;
			con = (HttpURLConnection) addr.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK ab24dd1e4290f735003b002390ea1231");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			String param = "cid=" + vo.getCid() + "&tid=" + vo.getTid() + "&cancel_amount=2200"
					+ "&cancel_tax_free_amount=0";
			OutputStream ops = con.getOutputStream();
			DataOutputStream dos = new DataOutputStream(ops);
			dos.writeBytes(param);
			dos.close();
			int result = con.getResponseCode();
			System.out.println(result);
			InputStream ips;
			if (result == 200) {
				ips = con.getInputStream();
			} else {
				ips = con.getErrorStream();
			}
			System.out.println(ips);
			InputStreamReader isr = new InputStreamReader(ips);
			BufferedReader bfr = new BufferedReader(isr);
			String result1 = bfr.readLine();
			System.out.println(result1);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		service.delete_pr(t_num);
		service.update_tps(t_num);
		return "redirect:/deal/management";
	}
}
