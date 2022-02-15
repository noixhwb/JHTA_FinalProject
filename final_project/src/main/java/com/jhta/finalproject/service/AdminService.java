package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.vo.CommunityVo;

import data.mybatis.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired AdminMapper mapper;
	
	// 채용공고 
	public List<JobVo> appliedJobList(HashMap<String, Object> map) {
		return mapper.appliedJobList(map);
	}
	public int confirmJob(int j_num) {
		return mapper.confirmJob(j_num);
	}
	public int rejectJob(int j_num) { 
		return mapper.rejectJob(j_num);
	}
	public int getJobCount() {
		return mapper.getJobCount();
	}
	
	// 동아리 
	public List<CircleVo> appliedCircleList(HashMap<String, Object> map) {
		return mapper.appliedCircleList(map);
	}
	public int confirmCircle(int ci_num) {
		return mapper.confirmCircle(ci_num);
	}
	public int rejectCircle(int ci_num) { 
		return mapper.rejectCircle(ci_num);
	}
	public int getCircleCount() {
		return mapper.getCircleCount();
	}
	
	// 커뮤니티 
	public List<CommunityVo> appliedCommuList(HashMap<String, Object> map) {
		return mapper.appliedCommuList(map);
	}
	public int confirmCommu(int cu_num) {
		return mapper.confirmCommu(cu_num);
	}
	public int rejectCommu(int cu_num) { 
		return mapper.rejectCommu(cu_num);
	}
	public int getCommuCount() {
		return mapper.getCommuCount();
	}
}
