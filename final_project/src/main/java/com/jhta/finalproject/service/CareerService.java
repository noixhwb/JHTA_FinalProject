package com.jhta.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jobvo.CareerVo;

import data.mybatis.mapper.CareerMapper;

@Service
public class CareerService {
	@Autowired private CareerMapper mapper;
	
	public int insert(CareerVo vo) {
		return mapper.insert(vo);
	}
	public int delete(int j_num) {
		return mapper.delete(j_num);
	}
	public int update(CareerVo vo) {
		return mapper.update(vo);
	}
	public List<CareerVo> list(){
		return mapper.list();
	}
	public CareerVo selectOne(int j_num) {
		return mapper.selectOne(j_num);
	}
}
