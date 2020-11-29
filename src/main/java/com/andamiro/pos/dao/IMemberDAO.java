package com.andamiro.pos.dao;

import com.andamiro.pos.model.LoginDTO;
import com.andamiro.pos.model.MemberDTO;
import com.andamiro.pos.model.UpdateDTO;

public interface IMemberDAO {
	public void insertMember(MemberDTO dto);
	public LoginDTO selectLogin(LoginDTO dto);
	public int selectId(String id);
	public MemberDTO selectMember(String id);
	public int selectPw(LoginDTO dto);
	public void updateMember(UpdateDTO dto);
	public void deleteMember(LoginDTO dto);
}
