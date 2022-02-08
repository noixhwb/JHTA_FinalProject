package com.jhta.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@AllArgsConstructor
@ToString
public class Purchase_infoVo {
	private int pi_num;
	private String pi_address;
	private String pi_phone;
	private String pi_name;
	private int t_num;
	private int m_num;
	private String request;
}
