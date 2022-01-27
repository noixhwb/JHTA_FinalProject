package com.jhta.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.DealVo;

import data.mybatis.mapper.HomeMapper;

@Service
public class HomeService {
	@Autowired private HomeMapper mapper;
	
	public List<CommunityVo> communityList(){
		return mapper.communityList();
	}
	public List<CircleVo> circleList(){
		return mapper.circleList(); 
	}
	public List<DealVo> dealList(){
		return mapper.dealList();
	}
	public List<JobVo> jobinfoList(){
		return mapper.jobinfoList();
	}
	
	
}
