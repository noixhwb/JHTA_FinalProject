package data.mybatis.mapper;

import java.util.HashMap;

import com.jhta.finalproject.vo.MemberVo;

public interface MemberMapper {

	int memberInsert(MemberVo vo);
	int authInsert(HashMap<String, String> map);
		
	

}
