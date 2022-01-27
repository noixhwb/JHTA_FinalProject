package data.mybatis.mapper;

import java.util.List;

import com.jhta.finalproject.circlevo.CircleVo;
import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.vo.CommunityVo;
import com.jhta.finalproject.vo.DealVo;

public interface HomeMapper {
	List<CommunityVo> communityList();
	List<CircleVo> circleList();
	List<DealVo> dealList();
	List<JobVo> jobinfoList();
	
}
