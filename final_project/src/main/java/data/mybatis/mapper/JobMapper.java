package data.mybatis.mapper;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.vo.MemberVo;


public interface JobMapper {
	int insert(JobVo vo);
	int delete(int j_num);
	int update(JobVo vo);
	List<JobVo> list(HashMap<String, Object> map);
	JobVo selectOne(int j_num);
	JobVo selectEvent(Date j_eventDate);
	int getCount(HashMap<String, Object> map);
	int addHit(int j_num);
	MemberVo selectUser(String m_id);
}
