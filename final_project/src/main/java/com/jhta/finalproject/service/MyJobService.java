package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jobvo.MyJobVo;

import data.mybatis.mapper.MyJobMapper;

@Service
public class MyJobService {
	@Autowired MyJobMapper mapper;
	
	public int insert(MyJobVo vo) {
		return mapper.insert(vo);
	}
	
	public int delete(HashMap<String, Integer> map) {
		return mapper.delete(map);
	}
	
	public List<MyJobVo> myScrap(int m_num){
		return mapper.myScrap(m_num);
	}
}
