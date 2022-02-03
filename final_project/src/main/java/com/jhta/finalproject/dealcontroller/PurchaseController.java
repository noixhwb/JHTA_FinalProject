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
import java.util.HashMap;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PurchaseController {
	@PostMapping(value="/deal/purchase",produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> kakaopay() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {	
			URL addr = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con = (HttpURLConnection)addr.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK ab24dd1e4290f735003b002390ea1231");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);//서버에 전해줄게 있는 경우			
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=https://developers.kakao.com/success&fail_url=https://developers.kakao.com/fail&cancel_url=https://developers.kakao.com/cancel";
			OutputStream ops = con.getOutputStream();
			DataOutputStream dos = new DataOutputStream(ops);
			dos.writeBytes(param);
			dos.close();
			int result = con.getResponseCode();
			InputStream ips;
			if(result==200) {
				ips = con.getInputStream();
			}else {
				ips = con.getErrorStream();
			}
			InputStreamReader isr = new InputStreamReader(ips);
			BufferedReader bfr = new BufferedReader(isr);
			System.out.println(bfr.readLine());
			map.put("result","success");
			return map;
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("result","error");
		return map;
	}
}
