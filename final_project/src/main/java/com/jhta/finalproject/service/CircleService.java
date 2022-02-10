package com.jhta.finalproject.service;

import java.util.HashMap;
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
	
	public int updateC(HashMap<String, Object> map) {
		return mapper.updateC(map);
	}
	
	public int updateB(HashMap<String, Object> map) {
		return mapper.updateB(map);
	}
	
	public List<CircleVo> selectAll() {
		return mapper.selectAll();
	}
	
	public CircleVo select(int ci_num) {
		return mapper.select(ci_num);
	}

	public List<CircleVo> selectMyCircle(int m_num) {
		return mapper.selectMyCircle(m_num);
	}
	
	public int selectPerson(int ci_num) {
		return mapper.selectPerson(ci_num);
	}
	
	public int selectMeRegister(HashMap<String, Integer> map) {
		return mapper.selectMeRegister(map);
	}
	
	public int addHit(int ci_num) {
		return mapper.addHit(ci_num);
	}
	
	public MemberVo selectM(String m_id) {
		return mapper.selectM(m_id);
	}
	
}
