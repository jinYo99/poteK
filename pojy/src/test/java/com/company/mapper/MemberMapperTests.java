package com.company.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper membermapper;

	@Test
	public void memberJoin() throws Exception{
		MemberVO member = new MemberVO();
		
		member.setUsername("신규회원 이름599");
		member.setUserid("신규회원 아이디599");
		member.setUserpw("신규회원 비밀번호599");
		member.setUseremail("신규회원 이메일599");
		
		membermapper.memberJoin(member);
	}

//	@Test
//	public void memberIdChk() throws Exception {
//		String id = "admin"; // 존재하는 아이디
//		String id2 = "test123"; // 존재하지 않는 아이디
//		int n1 = 0;
//		int n2 = 0;
//		n1 = membermapper.idCheck(id);
//		n2 = membermapper.idCheck(id2);
//		log.info("admin : " + n1 + ",test1234 : " + n2);
//	}
	
	@Test
	public void memberLogin() throws Exception{
		
		MemberVO member = new MemberVO();	// MemberVO 변숸언 및 초기화
		
		// 저장된 아이디
//		member.setUserid("test1");
//		member.setUserpw("Test1!");
		
		// 저장되지 않은 아이디
		member.setUserid("test123");
		member.setUserpw("Test123");
		
		membermapper.memberLogin(member);
		log.info("결과값 : " + membermapper.memberLogin(member));
	}

}
