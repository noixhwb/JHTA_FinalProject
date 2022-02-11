package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.vo.MemberVo;

public interface CircleMapper {
	int insert(CircleVo vo);
	int updateC(HashMap<String, Object> map);
	int updateB(HashMap<String, Object> map);
	
	List<CircleVo> selectAll();
	CircleVo select(int ci_num);
	List<CircleVo> selectMyCircle(int m_num);
	//Date selectToday();
	int selectPerson(int ci_num);
	
	int selectMyCircleCount(HashMap<String, Integer> map);
	int selectMeRegister(HashMap<String, Integer> map);
	int addHit(int ci_num);
	MemberVo selectM(String m_id); //해당페이지의 user 정보들 가져오기
}
