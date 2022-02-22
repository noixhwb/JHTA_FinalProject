package com.jhta.finalproject.timetablevo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class MySubjectRateVo {
	private int s_num;
	private String s_name;
	private String s_prof;
	private int sr_num;
	private int m_num;
	private String sr_content;
	private String sr_regdate;
	private int sr_recommend;

}
