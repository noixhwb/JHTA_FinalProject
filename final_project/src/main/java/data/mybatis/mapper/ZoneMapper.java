package data.mybatis.mapper;

import java.util.List;

import com.jhta.finalproject.jobvo.ZoneVo;


public interface ZoneMapper {
	int insert(ZoneVo vo);
	int delete(int j_num);
	int update(ZoneVo vo);
	List<ZoneVo> list();
}
