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
public class SubjectRateVo {
	private int sr_num;
	private int m_num;
	private String sr_content;
	private Date sr_regdate;
	private int sr_recommend;
	private int s_num;
}
