package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.jobvo.JobVo;


public interface JobMapper {
	int insert(JobVo vo);
	int delete(int j_num);
	int update(JobVo vo);
	List<JobVo> list(HashMap<String, Object> map);
	JobVo selectOne(int j_num);
	int getCount(HashMap<String, Object> map);
}
