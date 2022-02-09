package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.timetablevo.SubjectVo;


public interface SubjectMapper {
	List<SubjectVo> subjectList(HashMap<String, Object> map);
	int count(HashMap<String, Object> map);
	SubjectVo selectOne(int s_num);
	int insert(SubjectVo vo);
	int update(SubjectVo vo);
	int delete(int s_num);
	
}
