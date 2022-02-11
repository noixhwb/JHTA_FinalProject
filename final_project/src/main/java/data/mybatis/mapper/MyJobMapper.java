package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.jobvo.MyJobVo;

public interface MyJobMapper {
	int insert(MyJobVo vo);
	List<MyJobVo> myScrap(int m_num);
	int delete(HashMap<String, Integer> map);
}
