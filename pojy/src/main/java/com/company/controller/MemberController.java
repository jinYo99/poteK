package com.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.MemberVO;
import com.company.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private final Logger logger = LoggerFactory.getLogger(MemberController.class);

//	@Autowired
	private MemberService memberservice;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	// BCryptPasswordEncoder

	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() {
		logger.info("회원가입 페이지 이동");
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) {

//		logger.info("join 이동");

//		// 회원가입 서비스 실행
//		memberservice.memberJoin(member);
//		
//		logger.info("join service 성공");

		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		rawPw = member.getUserpw(); // 비밀번호 데이터 저장
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		member.setUserpw(encodePw); // 인코딩 된 비밀번호 member 객체에 다시 저장

		// 회원가입 쿼리 실행
		memberservice.memberJoin(member);

		return "redirect:/main";

	}

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {
		logger.info("로그인 페이지 이동");
	}

	// 아이디 중복검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String userid) throws Exception {

		// logger.info("중복확인 이동");

		int result = memberservice.idCheck(userid);

		// logger.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 아이디 중복
		} else {
			return "success"; // 사용가능 아이디
		}
	}

	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";

		MemberVO lvo = memberservice.memberLogin(member); // 입력한 아이디와 일치하는 아이디가 있는지

		if (lvo != null) { // 일치하는 아이디가 있으면,

			rawPw = member.getUserpw(); // 입력한 비밀번호
			encodePw = lvo.getUserpw(); // 데이터 베이스에 저장된 인코딩 한 비밀번호

			if (true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 확인

				lvo.setUserpw(""); // 인코딩 된 비밀번호 지움
				session.setAttribute("member", lvo); // session에 사용자 정보 저장
				return "redirect:/main"; // 메인 페이지 이동

			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login"; // 로그인 페이지로 이동
			}
		} else { // 일치하는 아이디가 없으면 ( 로그인 실패 )

			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login"; // 로그인 페이지로 이동
		}

	}

	// 로그아웃

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		log.info("logout 메소드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/main";

	}

}
