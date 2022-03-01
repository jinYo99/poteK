package com.company.service;

import java.util.List;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board); 	// 등록
	
	public BoardVO get(int bno);			// 읽기
	
	public List<BoardVO> getList();			// 목록
	
	public List<BoardVO> getListPaging(Criteria cri);	// 목록(페이징 적용)
	
	public int modify(BoardVO board);		// 수정
	
	public int delete(int bno);				// 삭제
	
	public int getTotal();					// 게시물 총 갯수
	
	
}
