package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.circlevo.CircleAdmJoinVo;
import com.jhta.finalproject.circlevo.CircleVo;

public interface CircleAdminMapper {
	List<CircleAdmJoinVo> appliedCircleList(HashMap<String, Object> map);
	int confirmCircle(int ci_num);
	int rejectCircle(int ci_num);
	int getCircleCount(HashMap<String, Object> map);
}
