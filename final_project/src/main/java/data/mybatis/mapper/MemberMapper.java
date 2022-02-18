package data.mybatis.mapper;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.jhta.finalproject.security.CustomMemberDetail;
import com.jhta.finalproject.vo.AuthoritiesVo;
import com.jhta.finalproject.vo.MemberVo;



public interface MemberMapper {
	CustomMemberDetail getAuths(String m_id);
	
	int addUser(MemberVo vo);
	int addAuth(AuthoritiesVo auth);
	List<MemberVo> getList(HashMap<String, Object> map);
	int getCount(HashMap<String, Object> map);
	

	

	MemberVo isMember(String mid);
	
	MemberVo isNick(String mnick);
	
	List<MemberVo> selectAll();
	
	
	MemberVo isId(String memail);

	MemberVo findPassword(MemberVo vo);
	MemberVo updatePassword(MemberVo vo);
	
	MemberVo selectUser(String m_id);

	MemberVo findPwdChk(@Param("m_id") String m_id, @Param("m_email") String m_email);

	int findPwd(MemberVo vo);

	int addrupdate(MemberVo vo);

	int allupdate(MemberVo vo);

	int deptupdate(MemberVo vo);

	int pwdupdate(MemberVo vo);


}
