package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.circlevo.CircleAdmJoinVo;
import com.jhta.finalproject.circlevo.CircleVo;

import data.mybatis.mapper.CircleAdminMapper;

@Service
public class CircleAdminService {
	@Autowired private CircleAdminMapper mapper;
	
	public List<CircleAdmJoinVo> appliedCircleList(HashMap<String, Object> map) {
		return mapper.appliedCircleList(map);
	}
	
	public int confirmCircle(int ci_num) {
		return mapper.confirmCircle(ci_num);
	}
	
	public int rejectCircle(int ci_num) { 
		return mapper.rejectCircle(ci_num);
	}
	
	public int getCircleCount(HashMap<String, Object> map) {
		return mapper.getCircleCount(map);
	}
}
