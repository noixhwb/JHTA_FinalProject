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
	
	public int Userdelete(HashMap<String, Integer> map) {
		return mapper.Userdelete(map);
	}
	
	public List<MyJobVo> myScrap(int m_num){
		return mapper.myScrap(m_num);
	}
	
	public int AdminDelete(int j_num) {
		return mapper.AdminDelete(j_num);
	}
}
