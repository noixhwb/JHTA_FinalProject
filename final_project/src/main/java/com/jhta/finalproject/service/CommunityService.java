package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.vo.BoardVo;
import com.jhta.finalproject.vo.BoardimgVo;
import com.jhta.finalproject.vo.CommentsVo;
import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.MemberVo;
import com.jhta.finalproject.vo.MyCommunityVo;

import data.mybatis.mapper.CommunityMapper;

@Service
public class CommunityService {

	@Autowired
	private CommunityMapper mapper;

	public MemberVo selectUser(String m_id) {

		return mapper.selectUser(m_id);
	}

	public int insertcm(CommunityVo vo) {
		return mapper.insertcm(vo);

	}

	public List<CommunityVo> selectAll(HashMap<String, Object> map) {
		return mapper.selectAll(map);
	}

	public CommunityVo select(int cu_num) {
		return mapper.select(cu_num);
	}

	public CommunityVo select1(CommunityVo vo1) {

		return mapper.select1(vo1);
	}

	public int insertBoard(BoardVo bvo) {

		return mapper.insertBoard(bvo);
	}

	public int insertBoardImg(BoardimgVo bivo) {
		return mapper.insertBoardImg(bivo);
	}

	public List<BoardVo> selectAllboard(int cu_num) {
		return mapper.selectAllboard(cu_num);

	}

	public List<BoardimgVo> selectimg(int b_num) {
		return mapper.selectimg(b_num);
	}

	public BoardVo detail(int b_num) {
		// TODO Auto-generated method stub
		return mapper.detail(b_num);
	}

	public BoardimgVo selectAllboardimg(int b_num) {
		return mapper.selectAllboardimg(b_num);
	}

	public int insertcomments(CommentsVo cvo) {
		return mapper.insertcomments(cvo);

	}

	public List<CommentsVo> selectcommentall(int b_num) {
		return mapper.selectcommentall(b_num);
	}

	public int getCount(HashMap<String, Object> map) {
		return mapper.getCount(map);
	}

	public int getCount1(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.getCount1(map);
	}

	public int addHit(int b_num) {
		return mapper.addHit(b_num);
	}

	
	public int updatecc(CommunityVo vo){
		return mapper.updatecc(vo);
	}


	
	public List<BoardVo> selectboard(int m_num){
		return mapper.selectboard(m_num);
	}
	
	public List<CommunityVo> selectmc(int m_num){
		return mapper.selectmc(m_num);
	}
	
	public CommunityVo selectcm(int cu_num) {
		return mapper.selectcm(cu_num);
	}
	
	public String selectbi(int b_num) {
		return mapper.selectbi(b_num);
	}
	
	public int insertmyc(MyCommunityVo vo) {
		return mapper.insertmyc(vo);
	}
	
	public int lastnum() {
		return mapper.lastnum();
	}
	public CommunityVo selectcc(int m_num){
		return mapper.selectcc(m_num);
	}
}
