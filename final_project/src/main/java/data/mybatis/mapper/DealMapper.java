package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.finalproject.vo.DealVo;
import com.jhta.finalproject.vo.Goods_ImageVo;
import com.jhta.finalproject.vo.MemberVo;
import com.jhta.finalproject.vo.Purchase_infoVo;

public interface DealMapper {
	int insert(DealVo vo);
	List<DealVo> selectAll(HashMap<String, Object> map);
	int count(HashMap<String, Object> map);
	int lastnum();
	int insertImg(HashMap<String, Object> map);
	List<Goods_ImageVo> selectImg(int t_num);
	DealVo selectOne(int t_num);
	MemberVo selectMember(String m_id);
	int insert_pi(Purchase_infoVo vo);
	int delete_pr(int t_num);
	List<Purchase_infoVo> select_pi(int m_num);
	List<DealVo> select_dl(int m_num);
	Purchase_infoVo select_pi2(int t_num);
	int update_deal(int t_num);
	int update_ship(HashMap<String, Object> map);
	List<DealVo> select_dp(int m_num);
	List<DealVo> select_all();
	int update_tp(HashMap<String, Object> map);
	
}
