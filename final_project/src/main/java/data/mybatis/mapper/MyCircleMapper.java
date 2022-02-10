package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.circlevo.MyCircleJoinVo;
import com.jhta.finalproject.circlevo.MyCircleListVo;
import com.jhta.finalproject.circlevo.MyCircleVo;

public interface MyCircleMapper {
	int insert(MyCircleVo vo);
	int delete(HashMap<String, Integer> map);
	List<MyCircleJoinVo> selectAllMyJoin(int m_num);
	List<MyCircleListVo> selectMyList(int ci_num);
}
