package com.jhta.finalproject.service;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.security.CustomMemberDetail;
import com.jhta.finalproject.vo.AuthoritiesVo;
import com.jhta.finalproject.vo.MemberVo;

import data.mybatis.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired private MemberMapper mapper;
	@Autowired private PasswordEncoder passwordEncoder;
	
	  public CustomMemberDetail getAuths(String m_id) {
		  return mapper.getAuths(m_id);
	  }
	
	  public int addUser(MemberVo vo) { 
		 String pwd=vo.getM_pwd();
		 vo.setM_pwd(passwordEncoder.encode(pwd));
		 mapper.addUser(vo); 
		 AuthoritiesVo auth=new AuthoritiesVo();
		 auth.setM_id(vo.getM_id());
		 if(vo.getM_id().equals("admin")) {
			 auth.setAuthority("ROLE_ADMIN");
			 mapper.addAuth(auth);
			 
		 }else {
			 auth.setAuthority("ROLE_MEMBER");
			 mapper.addAuth(auth);
		 }
		 return 1;
	  }
	  public int addAuth(AuthoritiesVo vo) {
		  return mapper.addAuth(vo);
	  }
	  public int idchk(MemberVo vo) {
		  return mapper.idchk(vo);
	  }

	}

	
	

//	  HashMap<Object, Object> map=new HashMap<Object, Object>(); 
//	  if(vo.getM_id().equals("admin")) {
//		  map.put("m_id", vo.getM_id());
//		  
//		  map.put("authority","ROLE_ADMIN");
//		  mapper.authInsert(map); 
//	  }else {
//		  map.put("m_id", vo.getM_id());
//		  	map.put("authority","ROLE_MEMBER");
//		  mapper.authInsert(map);
//	  }
//	  
//	  
//	  return 1; 
//	  }
	 
	  
	

