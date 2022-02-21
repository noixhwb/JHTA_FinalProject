package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.circlevo.MyCircleJoinVo;
import com.jhta.finalproject.circlevo.MyCircleListVo;
import com.jhta.finalproject.circlevo.MyCircleVo;

import data.mybatis.mapper.MyCircleMapper;

@Service
public class MyCircleService {
	@Autowired private MyCircleMapper mapper;
	
	public int insert(MyCircleVo vo) {
		return mapper.insert(vo);
	}
	
	public int delete(HashMap<String, Integer> map) {
		return mapper.delete(map);
	}
	
	public List<MyCircleJoinVo> selectAllMyJoin(HashMap<String, Object> map) {
		return mapper.selectAllMyJoin(map);
	}
	
	public List<MyCircleListVo> selectMyList(int ci_num) {
		return mapper.selectMyList(ci_num);
	}
}
