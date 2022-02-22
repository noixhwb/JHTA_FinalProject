package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.timetablevo.RegisterVo;

public interface RegisterMapper {
	List<RegisterVo> termList(int m_num);
	List<RegisterVo> termListName(int m_num);
	List<RegisterVo> termDetail(HashMap<String, Object> map);
	int insert(RegisterVo vo);
	int delete(HashMap<String, Object> map);
	
}
