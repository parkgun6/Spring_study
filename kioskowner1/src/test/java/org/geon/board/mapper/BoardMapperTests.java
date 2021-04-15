package org.geon.board.mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;
import java.util.List;

import org.geon.adminboard.domain.BoardVO;
import org.geon.adminboard.mapper.BoardMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	BoardMapper mapper;
	
	@Test
	public void read() {
		Long bno = 13L;
		
		log.info(mapper.read(bno));
	}
	
	@Test
	public void testGetList() {
		String[] arr = new String[1];
		arr[0] = "w";
		
		mapper.getList(1,10,3,arr,"박건").forEach(board -> log.info(board));
	}
	
	@Test
	public void testGetTotalCount() {
		String[] arr = new String[1];
		arr[0] = "t";
		
		log.info(mapper.getTotalCount(3,arr,""));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = BoardVO.builder().title("testinsert.....").content("test.....").writer("박건").category(1).build();
		
		mapper.insert(board);
	}

	@Test
	public void testUpdate() {
		BoardVO board = BoardVO.builder().bano(15L).title("testinsert.....").content("test.....").writer("박건").category(1).build();
		
		mapper.update(board);
	}
	
	@Test
	public void testDelete() {
		Long bno = 15L;
		
		mapper.delete(bno);
	}
}
