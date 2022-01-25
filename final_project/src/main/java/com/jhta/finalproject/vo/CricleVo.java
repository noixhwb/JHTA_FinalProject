package com.jhta.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class CricleVo { //CIRCLE테이블 VO
	private int ci_num;
	private String ci_name;
	private String ci_category;
	private int ci_person;
	private String ci_logofile;
	private int m_num;
	private int ci_ok;
	private int cib_num;
	private String ci_title;
	private String ci_content;
	private String ci_imgfile;
	private Date ci_startdate;
	private Date ci_enddate;
	private int ci_view;
	private int ci_recommend;
}
