package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.circlevo.LikeCircleJoinVo;
import com.jhta.finalproject.circlevo.LikeCircleVo;

public interface LikeCircleMapper {
	int insert(LikeCircleVo vo);
	int delete(HashMap<String, Object> map);
	List<LikeCircleJoinVo> selectMyLikeList(HashMap<String, Object> map);
	int selectLikeCircle(int ci_num);
	int selectMeLikeCircle(HashMap<String, Integer> map);
}
