package com.company.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class BoardServiceTests {

	// 배열 형태면 {} 사용
	@Setter(onMethod_ = { @Autowired })
	private BoardService service;

//	@Test
//	public void testRegister() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글 0002");
//		board.setContent("새로 작성하는 내용 0002");
//		board.setWriter("새로운 작성자 0003332");
//		
//		service.register(board);
//		log.info("생성된 게시물 번호: " + board.getBno());
//	}

	/* 게시판 목록 테스트 */
//	@Test
//	public void testRegister() {
//
//		BoardVO vo = new BoardVO();
//
//		vo.setTitle("service test");
//		vo.setContent("service test");
//		vo.setWriter("service test");
//
//		service.register(vo);
//
//	}
	
//	@Test
//    public void testGetList() {
//        
//        service.getList().forEach(board -> log.info("" + board));        
//        
//    }
	
//	@Test
//    public void testGETPage() {
//        
//        long bno = 8;
//        
//        log.info("" + service.get(bno));
//        
//    }
	
//	@Test
//    public void testModify() {
//        
//        BoardVO board = new BoardVO();
//        board.setBno((long) 8);
//        board.setTitle("수정 제목");
//        board.setContent("수정 내용");
//        
//        int result = service.modify(board);
//        log.info("result : " +result);
//        
//    }     

	/* 삭제 테스트 */
//	@Test
//	public void testDelete() {
//		int result = service.delete(5);
//		log.info("result : " + result);
//	}
	
	/* 페이징 테스트 */
//	@Test
//	public void getListPaging() {
//		
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(3);
//		
//		List list = service.getListPaging(cri);
//		
//		list.forEach(board -> log.info("" + board));
//	}
	
}
