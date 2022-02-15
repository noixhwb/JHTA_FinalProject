package com.jhta.finalproject.dealcontroller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.finalproject.service.DealService;

@RestController
public class ManagementController {
	@Autowired
	private DealService service;

	@PostMapping(value = "/deal/ship", produces = { MediaType.APPLICATION_JSON_VALUE })
	public String saveship(String t_shipping, String t_invoice, int t_num) {

		switch (t_shipping) {
		case "천일택배":
			t_shipping = "kr.chunilps";
			break;
		case "CJ대한통운":
			t_shipping = "kr.cjlogistics";
			break;
		case "CU편의점택배":
			t_shipping = "kr.cupost";
			break;
		case "GSPostbox택배":
			t_shipping = "kr.cvsnet";
			break;
		case "대신택배":
			t_shipping = "kr.daesin";
			break;
		case "우체국택배":
			t_shipping = "kr.epost";
			break;
		case "한진택배":
			t_shipping = "kr.hanjin";
			break;
		case "일양로지스":
			t_shipping = "kr.ilyanglogis";
			break;
		case "경동택배":
			t_shipping = "kr.kdexp";
			break;
		case "로젠택배":
			t_shipping = "kr.logen";
			break;
		case "롯데택배":
			t_shipping = "kr.lotte";
			break;

		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("t_shipping", t_shipping);
		map.put("t_invoice", t_invoice);
		map.put("t_processing", "배송중");
		map.put("t_num", t_num);
		service.update_ship(map);
		return "";
	}
}
