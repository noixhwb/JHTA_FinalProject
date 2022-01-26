package com.jhta.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.circlevo.CircleVo;

import data.mybatis.mapper.CircleMapper;

@Service
public class CircleService {
	@Autowired private CircleMapper mapper;
	
	public List<CircleVo> selectAll() {
		return mapper.selectAll();
	}
}
