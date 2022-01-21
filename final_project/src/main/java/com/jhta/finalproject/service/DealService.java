package com.jhta.finalproject.service;

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
}
