package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor

public class BoardServiceImp implements BoardService {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		log.info("register........" + board);
		mapper.insertSelectKey(board);
		
	}

	// 게시판 읽기
	@Override
	public BoardVO get(int bno) {
		log.info("get......" + bno);
		return mapper.read(bno);
	}

	// 게시판 수정
	@Override
	public int modify(BoardVO board) {
		log.info("modify....." + board);
		return mapper.modify(board);
		
	}

	// 게시판 목록
	@Override
	public List<BoardVO> getList() {
		log.info("getList.....");
		
		return mapper.getList();
	}
	
	// 게시판 목록(페이징 적용)
	@Override
	public List<BoardVO> getListPaging(Criteria cri) {
			
		return mapper.getListPaging(cri);
	}

	// 게시판 삭제
	@Override
	public int delete(int bno) {
		
		return mapper.delete(bno);
	}

	@Override
	public int getTotal() {
	
		return mapper.getTotal();
	}

	
	

	

	



}
