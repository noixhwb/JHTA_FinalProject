package com.jhta.finalproject.timetablevo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Data
public class TimetableVo {
	private int tt_num;
	private int m_num;
	private String s_name;
	private int s_score;
	private int m_score;
	private String tt_name;
}
