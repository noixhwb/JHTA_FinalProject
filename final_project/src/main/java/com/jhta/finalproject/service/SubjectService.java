package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.timetablevo.SubjectVo;

import data.mybatis.mapper.SubjectMapper;

@Service
public class SubjectService {
	@Autowired private SubjectMapper mapper;
	
	public List<SubjectVo> subjectList(HashMap<String, Object> map){
		return mapper.subjectList(map);
	}
	
	public List<SubjectVo> subjectListAll(){
		return mapper.subjectListAll();
	}
	
	public int count(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	
	public SubjectVo selectOne(int s_num) {
		return mapper.selectOne(s_num);
	}
}
