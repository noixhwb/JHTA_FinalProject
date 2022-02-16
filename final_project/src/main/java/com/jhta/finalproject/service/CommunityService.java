package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.MemberVo;

import data.mybatis.mapper.CommunityMapper;




@Service
public class CommunityService {

	@Autowired private CommunityMapper mapper;
	
	

	public MemberVo selectUser(String m_id) {
		
		return mapper.selectUser(m_id);
	}

	public int insertcm(CommunityVo vo) {
		return mapper.insertcm(vo);
		
	}

	public List<CommunityVo> selectAll() {
		return mapper.selectAll();
	}

	
}
