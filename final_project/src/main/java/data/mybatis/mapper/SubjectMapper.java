package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.timetablevo.SubjectVo;


public interface SubjectMapper {
	List<SubjectVo> subjectList(HashMap<String, Object> map);
	List<SubjectVo> subjectListAll();
	int count(HashMap<String, Object> map);
	SubjectVo selectOne(int s_num);
}
