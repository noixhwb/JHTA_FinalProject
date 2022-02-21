package com.jhta.finalproject.dealcontroller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.jhta.finalproject.service.DealService;
import com.jhta.finalproject.vo.DealVo;

@Controller
public class DealManagementController {
	@Autowired private DealService service;
	@GetMapping("/deal/management")
	public String move(Principal principal,Model model,HttpServletRequest request) {
		List<DealVo> list = service.select_all();
		for(DealVo li:list) {
			if(li.getT_processing().equals("배송중")) {
				//여기서 api호출
				try {
					URL addr = new URL("https://apis.tracker.delivery/carriers/"+li.getT_shipping()+"/tracks/"+li.getT_invoice());
					HttpURLConnection con;
					con = (HttpURLConnection) addr.openConnection();
					con.setRequestMethod("GET");
					con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
					con.setDoOutput(true);
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
					JSONObject state = (JSONObject) json2.get("state");
					String text = (String) state.get("text");
					
					if(text.equals("배달완료")) {
						//map에 집어넣고
						HashMap<String, Object> map = new HashMap<String, Object>();
						map.put("t_num", li.getT_num());
						map.put("t_processing", "거래완료");
						//db업데이트
						service.update_tp(map);
						
					}
				System.out.println("배송정보업데이트");
					
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
			}
		}
		String m_id = principal.getName();
		int m_num= service.selectMember(m_id).getM_num();
		List<DealVo> pvo = service.select_dp(m_num);
		List<DealVo> dvo = service.select_dl(m_num);
		model.addAttribute("dvo",dvo);
		model.addAttribute("pvo",pvo);
		return "/deal/dealmanagement";
	}
	@GetMapping("/deal/remove")
	public String remove(int t_num) {
		service.delete_gi(t_num);
		service.delete_pr(t_num);
		service.delete_dl(t_num);
		return "redirect:/deal/management";
	}
	
}
