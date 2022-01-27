package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.vo.DealVo;

public interface DealMapper {
	int insert(DealVo vo);
	List<DealVo> selectAll(HashMap<String, Object> map);
	int count(String word);
	int lastnum();
	int insertImg(HashMap<String, Object> map);
}
