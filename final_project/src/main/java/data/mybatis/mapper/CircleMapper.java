package data.mybatis.mapper;

import java.util.List;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.vo.MemberVo;

public interface CircleMapper {
	int insert(CircleVo vo);
	int update(CircleVo vo);
	List<CircleVo> selectAll();
	CircleVo select(int ci_num);
	List<CircleVo> selectMyCircle(int m_num);
	
	MemberVo selectM(String m_id); //해당페이지의 user 정보들 가져오기
}
