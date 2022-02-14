package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jobvo.JobVo;

import data.mybatis.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired AdminMapper mapper;
	
	// 채용공고 승인 리스트 불러오기
	public List<JobVo> appliedJobList(HashMap<String, Object> map) {
		return mapper.appliedJobList(map);
	}
	
	// 승인
	public int jobConfirm(int j_num) {
		return mapper.doConfirm(j_num);
	}
	
	// 거절
	public int delete(int j_num) { 
		return mapper.delete(j_num);
	}
	
	// 갯수
	public int getCount(HashMap<String, Object> map) {
		return mapper.getCount(map);
	}
	
}
