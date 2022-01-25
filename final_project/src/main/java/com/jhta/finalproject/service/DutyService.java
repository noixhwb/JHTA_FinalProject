package com.jhta.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jobvo.DutyVo;

import data.mybatis.mapper.DutyMapper;

@Service
public class DutyService {
	@Autowired private DutyMapper mapper;
	
	public int insert(DutyVo vo) {
		return mapper.insert(vo);
	}
	public int delete(int j_num) {
		return mapper.delete(j_num);
	}
	public int update(DutyVo vo) {
		return mapper.update(vo);
	}
	public List<DutyVo> list(){
		return mapper.list();
	}
}
