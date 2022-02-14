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
	private int s_num;
	private String tt_name;
}
