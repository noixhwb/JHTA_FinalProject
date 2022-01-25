package com.jhta.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jobvo.ZoneVo;

import data.mybatis.mapper.ZoneMapper;

@Service
public class ZoneService {
	@Autowired private ZoneMapper mapper;
	
	public int insert(ZoneVo vo) {
		return mapper.insert(vo);
	}
	public int delete(int j_num) {
		return mapper.delete(j_num);
	}
	public int update(ZoneVo vo) {
		return mapper.update(vo);
	}
	public List<ZoneVo> list(){
		return mapper.list();
	}
}
