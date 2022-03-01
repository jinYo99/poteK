package com.company.service;

import com.company.domain.MemberVO;

public interface MemberService {
	
	// 회원가입
	public void memberJoin(MemberVO member);

	// 아이디 중복
	public int idCheck(String userid) throws Exception;
	
	// 로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;
	

}
