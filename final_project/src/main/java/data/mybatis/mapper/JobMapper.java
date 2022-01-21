package data.mybatis.mapper;

import java.util.List;

import com.jhta.finalproject.vo.JobVo;

public interface JobMapper {
	int insert(JobVo vo);
	int delete(int j_num);
	int update(JobVo vo);
	List<JobVo> list();
}
