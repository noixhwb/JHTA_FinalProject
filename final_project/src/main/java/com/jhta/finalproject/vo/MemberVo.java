package com.jhta.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberVo {
	private String m_num;
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_phone;
	private String m_email;
	private String m_address;
	private String m_nickname;
	private String m_birth;
	private String m_dept;
	private String m_univnum;
	private String m_profile;
	private String m_auth;
}
