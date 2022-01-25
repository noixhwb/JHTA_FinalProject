package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.vo.SubjectRateVo;


public interface SubjectRateMapper {
	List<SubjectRateVo> rateList(HashMap<String, Object> map);
	int count(int s_num);
	List<SubjectRateVo> myrateList(HashMap<String, Object> map);
	int mycount(int m_num);
	int insert(SubjectRateVo vo);
	int update(SubjectRateVo vo);
	int delete(int sr_num);
	
}
