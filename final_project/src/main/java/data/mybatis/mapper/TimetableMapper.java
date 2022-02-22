package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.timetablevo.TimetableVo;

public interface TimetableMapper {
	List<TimetableVo> tableList(int m_num);
	List<TimetableVo> tableListName(int m_num);
	List<TimetableVo> tableDetail(HashMap<String, Object> map);
	int insert(TimetableVo vo);
	
}
