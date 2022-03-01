package com.company.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

	public class BoardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testInsert() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글");
//		board.setContent("새로 작성 하는 내용");
//		board.setWriter("새로운 작성자");
//		
//		mapper.insert(board);
//		log.info(board);
//	}
	
//	@Test
//	 public void testInsertSelectKey() {
//	 BoardVO board = new BoardVO();
//	 board.setTitle("새로 작성하는 글SelectKey");
//	 board.setContent("새로 작성하는 내용SelectKey");
//	 board.setWriter("새로운 작성자SelectKey");
//	 
//	 mapper.insertSelectKey(board);
//	 log.info(board);
//	 
//	}
	
//	@Test
//	 public void testRead() {
//	 BoardVO board = mapper.read(7L);
//	 // L 은 bno 가 long 타입이라는 것을 알림.
//	
//	 log.info(board);
//	 }

//	 @Test
//	 public void testDelete() {
//	 log.info("delete cnt: "+mapper.delete(2L));
//	 }
	
//	@Test
//	public void testUpdate() {
//	BoardVO board = new BoardVO();
//	board.setBno(5L);
//	board.setTitle("수정된 제목");
//	board.setContent("수정된 내용11");
//	board.setWriter("user00");
//	int count=mapper.update(board);
//	log.info("update cnt : "+count);
//	}

//	@Test
//    public void testGetList() {
//        
//        
//        List list = mapper.getList();
//       /* 일반적 for문 */
//        for(int i = 0; i < list.size();i++) {
//            log.info("" + list.get(i));
//        }
//        
//    }
	
//	@Test
//    public void testGetPage() {
//        
//        /* 실제 존재하는 페이지 */
//        long bno = 8;
//        
//        log.info("" + mapper.read(bno));
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
//        int result = mapper.modify(board);
//        log.info("result : " + result);
//        
//    }
	
// 	삭제 테스트
//	@Test	
//	public void testDelete() {
//		int result = mapper.delete(8);
//		log.info("result : " + result);
//	}
	
	// 게시판 목록(페이징 테스트)
	 @Test
     public void testGetListPaging() {
         
         Criteria cri = new Criteria();
         
         cri.setPageNum(3);
                          
         List list = mapper.getListPaging(cri);
         
         list.forEach(board -> log.info("" + board));
     }
	
}
