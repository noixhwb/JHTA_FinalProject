package com.jhta.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.vo.BoardVo;
import com.jhta.finalproject.vo.BoardimgVo;
import com.jhta.finalproject.vo.CommentsVo;
import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.Goods_ImageVo;
import com.jhta.finalproject.vo.MemberVo;

import data.mybatis.mapper.CommunityMapper;




@Service
public class CommunityService {

	@Autowired private CommunityMapper mapper;
	
	

	public MemberVo selectUser(String m_id) {
		
		return mapper.selectUser(m_id);
	}

	public int insertcm(CommunityVo vo) {
		return mapper.insertcm(vo);
		
	}

	public List<CommunityVo> selectAll() {
		return mapper.selectAll();
	}

	public CommunityVo select(int cu_num) {
		return mapper.select(cu_num);
	}

	

	public CommunityVo select1(CommunityVo vo1) {
		// TODO Auto-generated method stub
		return mapper.select1(vo1);
	}

	

	public int insertBoard(BoardVo bvo) {
		
		return  mapper.insertBoard(bvo);
	}

	public int insertBoardImg(BoardimgVo bivo) {
		return  mapper.insertBoardImg(bivo);
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
	public int getCount (HashMap<String, Object> map) {
		return mapper.getCount(map);
	}

	
	}

	

	

	
	

	
	
	

	

