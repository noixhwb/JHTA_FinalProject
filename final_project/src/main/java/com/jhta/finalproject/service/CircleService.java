package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.circlevo.CircleListJoinVo;
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
	
	public List<CircleVo> selectCat(HashMap<String, Object> map) {
		return mapper.selectCat(map);
	}
	
	public List<CircleVo> selectCatView(HashMap<String, Object> map) {
		return mapper.selectCatView(map);
	} 
	
	public List<CircleVo> selectCatRec(HashMap<String, Object> map) {
		return mapper.selectCatRec(map);
	}
	
	public CircleVo select(int ci_num) {
		return mapper.select(ci_num);
	}

	public List<CircleVo> selectMyCircle(HashMap<String, Object> map) {
		return mapper.selectMyCircle(map);
	}
	
	public List<CircleListJoinVo> selectList(int ci_num) {
		return mapper.selectList(ci_num);
	}
	
	public int selectPerson(int ci_num) {
		return mapper.selectPerson(ci_num);
	}
	
	public int selectMyCircleCount(HashMap<String, Integer> map) {
		return mapper.selectMyCircleCount(map);
	}
	
	public int selectMeRegister(HashMap<String, Integer> map) {
		return mapper.selectMeRegister(map);
	}
	
	public int count(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	
	public int addHit(int ci_num) {
		return mapper.addHit(ci_num);
	}
	
	public int addLike(int ci_num) {
		return mapper.addLike(ci_num);
	}
	
	public int minusLike(int ci_num) {
		return mapper.minusLike(ci_num);
	}
	
	public MemberVo selectM(String m_id) {
		return mapper.selectM(m_id);
	}
	
}
