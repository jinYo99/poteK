package com.company.domain;

import lombok.Data;

@Data

public class MemberVO {

	private String username;
	
	private String userid;
	
	private String userpw;
	
	private String useremail;
	
	// 관리자, 일반회원 구분
	private int adminch;
	
	// 만든 날짜
	private int regdate;

	
}
