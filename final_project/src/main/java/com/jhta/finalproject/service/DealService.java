package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.vo.DealVo;

import data.mybatis.mapper.DealMapper;

@Service
public class DealService {
	@Autowired private DealMapper mapper;
	
	public int insert(DealVo vo) {
		return mapper.insert(vo);
	}
	public List<DealVo> selectAll(HashMap<String, Object> map){
		return mapper.selectAll(map);
	}
	public int count(String word) {
		return mapper.count(word);
	}
	
	public int lastnum() {
		return mapper.lastnum();
	}
	public int insertImg(HashMap<String, Object> map) {
		return mapper.insertImg(map);
	}
}
