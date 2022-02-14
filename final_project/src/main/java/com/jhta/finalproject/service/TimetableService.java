package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.timetablevo.TimetableVo;

import data.mybatis.mapper.TimetableMapper;

@Service
public class TimetableService {
	@Autowired private TimetableMapper mapper;
	
	public List<TimetableVo> tableList(int m_num){
		return mapper.tableList(m_num);
	}
	
	public List<TimetableVo> tableDetail(HashMap<String, Object> map){
		return mapper.tableDetail(map);
	}
	
	public int insert(TimetableVo vo) {
		return mapper.insert(vo);
	}
}
