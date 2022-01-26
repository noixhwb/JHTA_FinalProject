package data.mybatis.mapper;



import com.jhta.finalproject.security.CustomMemberDetail;
import com.jhta.finalproject.vo.AuthoritiesVo;
import com.jhta.finalproject.vo.MemberVo;

public interface MemberMapper {
	CustomMemberDetail getAuths(String m_id);
	
	int addUser(MemberVo vo);
	int addAuth(AuthoritiesVo auth);
	
	
	

}
