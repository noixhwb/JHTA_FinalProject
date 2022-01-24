package com.jhta.finalproject.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.vo.MemberVo;

import data.mybatis.mapper.MemberMapper;
@Service
public class MemberService {
	@Autowired private MemberMapper mapper;
	//@Autowired private PasswordEncoder passwordEncoder;

	public int insert(MemberVo vo) {
		String pwd=vo.getM_pwd();
		//vo.setM_pwd(passwordEncoder.encode(pwd));
		mapper.memberInsert(vo);
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("m_num", vo.getM_num());
		map.put("authority","ROLE_MEMBER");
		mapper.authInsert(map);
		
		return 1;
	}
	 
}
