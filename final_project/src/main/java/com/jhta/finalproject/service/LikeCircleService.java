package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.circlevo.LikeCircleJoinVo;
import com.jhta.finalproject.circlevo.LikeCircleVo;

import data.mybatis.mapper.LikeCircleMapper;

@Service
public class LikeCircleService {
	@Autowired private LikeCircleMapper mapper;
	
	public int insert(LikeCircleVo vo) {
		return mapper.insert(vo);
	}
	
	public int delete(HashMap<String, Object> map) {
		return mapper.delete(map);
	}
	
	public List<LikeCircleJoinVo> selectMyLikeList(HashMap<String, Object> map) {
		return mapper.selectMyLikeList(map);
	}
	
	public int selectLikeCircle(int ci_num) {
		return mapper.selectLikeCircle(ci_num);
	}
	
	public int selectMeLikeCircle(HashMap<String, Integer> map) {
		return mapper.selectMeLikeCircle(map);
	}
}
