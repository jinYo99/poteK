package com.company.mapper;

import java.util.List;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList();					// 목록
	
	public List<BoardVO> getListPaging(Criteria cri);	// 목록(페이징 적용)
	
	public void insert(BoardVO board);				// bno 는 시퀀스 자동 생성 ( 등록 )
	
	public void insertSelectKey(BoardVO board);		// 생성되는 시퀀스 값을 확인
	
	public BoardVO read(int bno);					// 게시판 읽기
	
	public int modify(BoardVO board);				// 게시판 수정
	
	public int delete(int bno);						// 게시판 삭제
	
	public int getTotal();							// 게시물 총 갯수
	


}
