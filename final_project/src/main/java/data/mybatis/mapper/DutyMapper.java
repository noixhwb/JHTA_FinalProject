package data.mybatis.mapper;

import java.util.List;

import com.jhta.finalproject.jobvo.DutyVo;


public interface DutyMapper {
	int insert(DutyVo vo);
	int delete(int j_num);
	int update(DutyVo vo);
	List<DutyVo> list();
	DutyVo selectOne(int j_num);
}
