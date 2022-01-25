package com.jhta.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Data
public class SubjectVo {
	private int s_num;
	private String s_name;
	private String s_category;
	private String s_prof;
	private String s_class;
	private String s_day;
	private int s_starttime;
	private int s_endtime;
	private int s_score;
}
