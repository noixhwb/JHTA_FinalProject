package com.jhta.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MycommBoVo {
	private int b_num;
	private int m_num;
	private String b_content;
	private Date b_regdate;
	private int b_recommend;
	private int cu_num;
	private String b_title;
	private String i_filename;
	private String cu_name;
}
