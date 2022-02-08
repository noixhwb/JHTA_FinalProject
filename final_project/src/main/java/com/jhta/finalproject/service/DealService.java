package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.vo.DealVo;
import com.jhta.finalproject.vo.Goods_ImageVo;
import com.jhta.finalproject.vo.MemberVo;
import com.jhta.finalproject.vo.ParchaseresultVo;
import com.jhta.finalproject.vo.Purchase_infoVo;

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
	public int insert_pr(ParchaseresultVo vo) {
		return mapper.insert_pr(vo);
	}
	public int insert_pi(Purchase_infoVo vo) {
		return mapper.insert_pi(vo);
	}
	public ParchaseresultVo select_pr(int t_num) {
		return mapper.select_pr(t_num);
	}
	public int delete_pr(int t_num) {
		return mapper.delete_pr(t_num);
	}
}
