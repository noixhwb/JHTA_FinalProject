package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.timetablevo.RegisterVo;

import data.mybatis.mapper.RegisterMapper;

@Service
public class RegisterService {
	@Autowired private RegisterMapper mapper;
	
	public List<RegisterVo> termList(int m_num){
		return mapper.termList(m_num);
	}
	
	public List<RegisterVo> termListName(int m_num){
		return mapper.termListName(m_num);
	}
	
	public List<RegisterVo> termDetail(HashMap<String, Object> map){
		return mapper.termDetail(map);
	}
	
	public int insert(RegisterVo vo) {
		return mapper.insert(vo);
	}
	
	public int delete(HashMap<String, Object> map) {
		return mapper.delete(map);
	}
}
