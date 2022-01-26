package com.jhta.finalproject.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.jhta.finalproject.service.MemberService;

public class CustomMemberDetailService implements UserDetailsService{
	@Autowired private MemberService service;

	@Override
	public UserDetails loadUserByUsername(String m_id) throws UsernameNotFoundException {
		CustomMemberDetail userDetail=service.getAuths(m_id);
		return userDetail;
	}
	

}
