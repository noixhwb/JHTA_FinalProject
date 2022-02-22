package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.circlevo.CircleListJoinVo;
import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.vo.MemberVo;

public interface CircleMapper {
	int insert(CircleVo vo);
	int updateC(HashMap<String, Object> map);
	int updateB(HashMap<String, Object> map);
	
	List<CircleVo> selectAll();
	List<CircleVo> selectCat(HashMap<String, Object> map);
	List<CircleVo> selectCatView(HashMap<String, Object> map);
	List<CircleVo> selectCatRec(HashMap<String, Object> map);
	CircleVo select(int ci_num);
	List<CircleVo> selectMyCircle(HashMap<String, Object> map);
	
	List<CircleListJoinVo> selectList(int ci_num);
	int selectPerson(int ci_num);
	
	int selectMyCircleCount(HashMap<String, Integer> map);
	int selectMeRegister(HashMap<String, Integer> map);
	
	int count(HashMap<String, Object> map);
	int addHit(int ci_num);
	int addLike(int ci_num);
	int minusLike(int ci_num);
	int remove(int ci_num);
	int removem(int ci_num);
	int removeb(int ci_num);
	int removelike(int ci_num);
	MemberVo selectM(String m_id); //해당페이지의 user 정보들 가져오기
}
