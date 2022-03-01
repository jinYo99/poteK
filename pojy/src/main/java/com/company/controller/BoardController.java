package com.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.PageDTO;
import com.company.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("")
public class BoardController {
	
	private BoardService service;

	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
//	@RequestMapping(value = "/main", method = RequestMethod.GET)
//	public void mainPageGET() {
//		logger.info("메인 페이지 이동");
//	}
	
//	@GetMapping("/main")
//	public void boardListGET(Model model) {
//		
//		log.info("메인 페이지 이동");
//		
//		model.addAttribute("list", service.getList());
//	}
	
	
	/* 게시물 목록(메인) 페이지 접속(페이징 적용) */
	@GetMapping("/main")
	public void boardListGET(Model model, Criteria cri) {
		
		log.info("boardListGET");
		
		model.addAttribute("list", service.getListPaging(cri));
		
		int total = service.getTotal();
		
		PageDTO pageMake = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
	}
	
	
	// 게시판 등록 페이지 이동
	@GetMapping("/register")
	public void boardRegister() {
		log.info("게시판 등록 페이지 이동");
	}

	// 게시판 등록
	@PostMapping("/register")
	public String voardRegisterPOST(BoardVO board, RedirectAttributes rttr) {
		log.info("BoardVO : " + board);
		
		service.register(board);
		
		rttr.addFlashAttribute("result", "register success");
		
		return "redirect:/main";
	}
	
	// 게시판 조회
	@GetMapping("/get")
	public void boardGetPageGET(int bno, Model model, Criteria cri) {
		
		model.addAttribute("pageInfo", service.get(bno));
		
		model.addAttribute("cri", cri);
		
	}
	
	// 수정 페이지 이동
	@GetMapping("/modify")
	public void boardModifyGET(int bno, Model model, Criteria cri) {
		
		model.addAttribute("pageInfo", service.get(bno));
		
		model.addAttribute("cri", cri);
	}
	
	// 게시물 수정
	@PostMapping("/modify")
	public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
		
		service.modify(board);
		
		rttr.addFlashAttribute("result", "modify success");
		
		return "redirect:/main";
	}
	
	// 게시물 삭제
	@PostMapping("/delete")
	public String boardDeletePOST(int bno, RedirectAttributes rttr) {
		
		service.delete(bno);
		
		rttr.addFlashAttribute("result", "delete success");
		
		return "redirect:/main";
	}
	
	


	

}
