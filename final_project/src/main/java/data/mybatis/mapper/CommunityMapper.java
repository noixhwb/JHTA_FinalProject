package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.vo.BoardVo;
import com.jhta.finalproject.vo.BoardimgVo;
import com.jhta.finalproject.vo.CommentsVo;
import com.jhta.finalproject.vo.CommunityVo;

import com.jhta.finalproject.vo.MemberVo;

public interface CommunityMapper {

	

	MemberVo selectUser(String m_id);

	int insertcm(CommunityVo vo);

	
	List<CommunityVo> selectAll(HashMap<String, Object> map);
	CommunityVo select(int cu_num);

	CommunityVo select1(int name);

	CommunityVo select1(CommunityVo vo1);

	int insertBoard(BoardVo bvo);

	int insertBoardImg(BoardimgVo bivo);

	
	List<BoardimgVo> selectimg(int b_num);

	BoardVo detail(Object object);

	BoardimgVo selectAllboardimg(int b_num);

	int insertcomments(CommentsVo cvo);

	List<CommentsVo> selectcommentall(int b_num);

	int getCount(HashMap<String, Object> map);

	int getCount1(HashMap<String, Object> map);

	List<BoardVo> selectAllboard(int cu_num);


	int addHit(int b_num);


	List<BoardVo> selectboard(int m_num);

	
	List<CommunityVo> selectmc(int m_num);
	
	CommunityVo selectcm(int cu_num);
	
	String selectbi(int b_num);
}
