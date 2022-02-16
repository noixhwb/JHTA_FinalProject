package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.MemberVo;

public interface CommunityMapper {

	

	MemberVo selectUser(String m_id);

	int insertcm(CommunityVo vo);

	List<CommunityVo> selectAll();
	
	
}
