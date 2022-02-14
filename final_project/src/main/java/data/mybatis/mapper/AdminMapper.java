package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.jobvo.JobVo;

public interface AdminMapper {
	List<JobVo> appliedJobList(HashMap<String, Object> map);
	int delete(int j_num);
	int doConfirm(int j_num);
	int getCount(HashMap<String, Object> map);
}
