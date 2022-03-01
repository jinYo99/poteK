package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.MemberVO;
import com.company.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImp implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	MemberMapper membermapper;

	// 회원가입
	@Override
	public void memberJoin(MemberVO member) {

		membermapper.memberJoin(member);
		
	}
	
	// 아이디 중복체크
	@Override
	public int idCheck(String userid) throws Exception {
		
		return membermapper.idCheck(userid);
	}

	// 로그인
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		return membermapper.memberLogin(member);
	}

}
