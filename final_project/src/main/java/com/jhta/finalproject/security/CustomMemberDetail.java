package com.jhta.finalproject.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.jhta.finalproject.vo.AuthoritiesVo;

public class CustomMemberDetail implements UserDetails{
	private String m_id;
	private String m_pwd;
	private String m_enabled;
	private List<AuthoritiesVo> authList;
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auths=new ArrayList<GrantedAuthority>();
		for(AuthoritiesVo vo:authList) {
			auths.add(new SimpleGrantedAuthority(vo.getAuthority()));
		}
		return auths;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return m_pwd;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return m_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	

}
