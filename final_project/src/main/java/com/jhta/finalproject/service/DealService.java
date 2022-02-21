package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.vo.DealVo;
import com.jhta.finalproject.vo.Goods_ImageVo;
import com.jhta.finalproject.vo.MemberVo;
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

	public int insert_pi(Purchase_infoVo vo) {
		return mapper.insert_pi(vo);
	}

	public int delete_pr(int t_num) {
		return mapper.delete_pr(t_num);
	}
	public List<Purchase_infoVo> select_pi(int m_num) {
		return mapper.select_pi(m_num);
	}
	public List<DealVo> select_dl(int m_num) {
		return mapper.select_dl(m_num);
	}
	public Purchase_infoVo select_pi2(int t_num) {
		return mapper.select_pi2(t_num);
	}
	public int update_deal(int t_num) {
		return mapper.update_deal(t_num);
	}
	public int update_ship(HashMap<String, Object> map) {
		return mapper.update_ship(map);
	}
	public List<DealVo> select_dp(int m_num){
		return mapper.select_dp(m_num);
	}
	public List<DealVo> select_all(){
		return mapper.select_all();
	}
	public int update_tp(HashMap<String, Object> map) {
		return mapper.update_tp(map);
	}
	public int update_tps(int t_num) {
		return mapper.update_tps(t_num);
	}
	public int update_tpr(int t_num) {
		return mapper.update_tpr(t_num);
	}
	
	public int delete_dl(int t_num) {
		return mapper.delete_dl(t_num);
	}
	
	public int delete_gi(int t_num) {
		return mapper.delete_gi(t_num);
	}
}
