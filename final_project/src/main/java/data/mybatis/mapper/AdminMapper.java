package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.vo.CommunityVo;

public interface AdminMapper {
	//채용공고 
	List<JobVo> appliedJobList(HashMap<String, Object> map);
	int confirmJob(int j_num);
	int rejectJob(int j_num);
	int getJobCount();
	
	// 동아리
	List<CircleVo> appliedCircleList(HashMap<String, Object> map);
	int confirmCircle(int ci_num);
	int rejectCircle(int ci_num);
	int getCircleCount();
	
	//커뮤니티
	List<CommunityVo> appliedCommuList(HashMap<String, Object> map);
	int confirmCommu(int cu_num);
	int rejectCommu(int cu_num);
	int getCommuCount();
}
