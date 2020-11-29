package com.andamiro.pos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.andamiro.pos.dao.IMemberDAO;
import com.andamiro.pos.model.LoginDTO;
import com.andamiro.pos.model.MemberDTO;
import com.andamiro.pos.model.UpdateDTO;

@Service("IMemberService")
public class MemberServiceImpl implements IMemberService{
	@Autowired
	private IMemberDAO dao;

	@Override
	public void insertMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		dao.insertMember(dto);
	}

	@Override
	public LoginDTO selectLogin(LoginDTO dto) {
		// TODO Auto-generated method stub
		return dao.selectLogin(dto);
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return dao.selectId(id);
	}
	
	@Override
	public MemberDTO selectMember(String id) {
		// TODO Auto-generated method stub
		return dao.selectMember(id);
	}

	@Override
	public int pwCheck(LoginDTO dto) {
		// TODO Auto-generated method stub
		return dao.selectPw(dto);
	}

	@Override
	public void updateMember(UpdateDTO dto) {
		// TODO Auto-generated method stub
		dao.updateMember(dto);
	}

	@Override
	public void deleteMember(LoginDTO dto) {
		// TODO Auto-generated method stub
		dao.deleteMember(dto);
	}
}
