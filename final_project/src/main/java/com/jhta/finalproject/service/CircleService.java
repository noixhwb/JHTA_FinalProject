package com.jhta.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.vo.MemberVo;

import data.mybatis.mapper.CircleMapper;

@Service
public class CircleService {
	@Autowired private CircleMapper mapper;
	
	public int insert(CircleVo vo) {
		return mapper.insert(vo);
	}
	
	//public int update(CircleVo vo) {
	//	return mapper.update(vo);
	//}
	
	public List<CircleVo> selectAll() {
		return mapper.selectAll();
	}
	
	public CircleVo select(int ci_num) {
		return mapper.select(ci_num);
	}

	public MemberVo selectM(String m_id) {
		return mapper.selectM(m_id);
	}
}
