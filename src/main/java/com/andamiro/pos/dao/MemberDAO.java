package com.andamiro.pos.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.andamiro.pos.model.LoginDTO;
import com.andamiro.pos.model.MemberDTO;
import com.andamiro.pos.model.UpdateDTO;

@Repository
public class MemberDAO implements IMemberDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertMember(MemberDTO dto) {
		System.out.println("insert Member() 처리");
		mybatis.insert("memberService.insertMember", dto);
	}

	@Override
	public LoginDTO selectLogin(LoginDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("select Member() 처리");
		dto = mybatis.selectOne("memberService.selectLogin", dto);
		return dto;
	}

	@Override
	public int selectId(String id) {
		// TODO Auto-generated method stub
		System.out.println("아이디 중복확인 처리");
		return mybatis.selectOne("memberService.selectId", id);
	}
	
	@Override
	public MemberDTO selectMember(String id) {
		System.out.println("select Member() 처리");
		return mybatis.selectOne("memberService.selectMember", id);
	}

	@Override
	public int selectPw(LoginDTO dto) {
		System.out.println("비밀번호 일치 여부 확인");
		return mybatis.selectOne("memberService.selectPw", dto);
	}

	@Override
	public void updateMember(UpdateDTO dto) {
		System.out.println("update Member() 처리");
		mybatis.update("memberService.updateMember", dto);
	}

	@Override
	public void deleteMember(LoginDTO dto) {
		System.out.println("delete Member() 처리");
		mybatis.delete("memberService.deleteMember", dto);
	}
	
}
