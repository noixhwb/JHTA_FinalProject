package com.jhta.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@NoArgsConstructor
@Data
@AllArgsConstructor
@ToString
public class DealVo {
	private int t_num;
	private String t_name;
	private String t_explanation;
	private int m_num;
	private int t_price;
	private String t_processing;
	private Date t_regdate;
	private String t_title;
	private String m_id;
}
