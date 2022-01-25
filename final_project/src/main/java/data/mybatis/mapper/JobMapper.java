package data.mybatis.mapper;

import java.util.List;

import com.jhta.finalproject.jobvo.JobVo;


public interface JobMapper {
	int insert(JobVo vo);
	int delete(int j_num);
	int update(JobVo vo);
	List<JobVo> list();
	JobVo selectOne(int j_num);
}
