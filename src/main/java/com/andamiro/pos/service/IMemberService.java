package com.andamiro.pos.service;

import com.andamiro.pos.model.LoginDTO;
import com.andamiro.pos.model.MemberDTO;
import com.andamiro.pos.model.UpdateDTO;

public interface IMemberService {
	public void insertMember(MemberDTO dto);
	public LoginDTO selectLogin(LoginDTO dto);
	public int idCheck(String id);
	public MemberDTO selectMember(String id);
	public int pwCheck(LoginDTO dto);
	public void updateMember(UpdateDTO dto);
	public void deleteMember(LoginDTO dto);
}
