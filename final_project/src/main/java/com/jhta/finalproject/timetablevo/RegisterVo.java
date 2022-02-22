package com.jhta.finalproject.timetablevo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Data
public class RegisterVo {
	private int r_num;
	private int m_num;
	private String s_name;
	private int s_score;
	private Double m_score;
	private String r_name;
}
