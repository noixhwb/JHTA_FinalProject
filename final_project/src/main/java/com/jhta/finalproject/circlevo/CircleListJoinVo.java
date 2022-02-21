package com.jhta.finalproject.circlevo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class CircleListJoinVo {
	private int ci_num;
	private int m_num;
	private String m_id;
	private String m_name;
	private String m_nickname;
	private String m_phone;
	private String m_email;
	private String m_dept;
}
