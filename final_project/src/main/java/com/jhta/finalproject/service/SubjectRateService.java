package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.vo.SubjectRateVo;

import data.mybatis.mapper.SubjectRateMapper;

@Service
public class SubjectRateService {
	@Autowired private SubjectRateMapper mapper;
	
	public List<SubjectRateVo> rateList(HashMap<String, Object> map){
		return mapper.rateList(map);
	}
	
	public int count(int s_num) {
		return mapper.count(s_num);
	}
	
	public List<SubjectRateVo> myrateList(HashMap<String, Object> map){
		return mapper.rateList(map);
	}
	
	public int mycount(int m_num) {
		return mapper.mycount(m_num);
	}
	
	public int insert(SubjectRateVo vo) {
		return mapper.insert(vo);
	}
	
	public int update(SubjectRateVo vo) {
		return mapper.update(vo);
	}
	
	public int delete(int sr_num) {
		return mapper.delete(sr_num);
	}
}
