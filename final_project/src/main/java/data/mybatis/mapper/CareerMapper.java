package data.mybatis.mapper;

import java.util.List;

import com.jhta.finalproject.jobvo.CareerVo;


public interface CareerMapper {
	int insert(CareerVo vo);
	int delete(int j_num);
	int update(CareerVo vo);
	List<CareerVo> list();
}
