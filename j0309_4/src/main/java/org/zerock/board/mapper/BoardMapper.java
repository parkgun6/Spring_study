package org.zerock.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.zerock.board.domain.Board;

public interface BoardMapper {
	
	
	@Select("select * from tbl_board order by bno desc limit #{skip},#{count}")
	List<Board> getList(@Param("skip") int skip,@Param("count") int count);
	
	//리스트 페이지메이커용
	int getTotalCount();
	
	//service에서 dto로 변환해주기때문에 vo로 받는다.
	void insert(Board board);


}
