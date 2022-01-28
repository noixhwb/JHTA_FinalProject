package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.vo.DealVo;
import com.jhta.finalproject.vo.Goods_ImageVo;
import com.jhta.finalproject.vo.MemberVo;

import data.mybatis.mapper.DealMapper;

@Service
public class DealService {
	@Autowired private DealMapper mapper;
	
	public int insert(DealVo vo) {
		return mapper.insert(vo);
	}
	public List<DealVo> selectAll(HashMap<String, Object> map){
		return mapper.selectAll(map);
	}
	public int count(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	
	public int lastnum() {
		return mapper.lastnum();
	}
	public int insertImg(HashMap<String, Object> map) {
		return mapper.insertImg(map);
	}
	public List<Goods_ImageVo> selectImg(int t_num) {
		return mapper.selectImg(t_num);
	}
	public DealVo selectOne(int t_num) {
		return mapper.selectOne(t_num);
	}
	public MemberVo selectMember(String m_id) {
		return mapper.selectMember(m_id);
	}
}
