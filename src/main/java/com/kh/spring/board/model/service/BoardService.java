package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;

//인터페이스로 따로 만드는 이유 -> 프록시패턴을 쓸 때 인터페이스가 필요하고, 트랜잭션 처리를 위해서(AOP 관련된 클래스를 만들때만 만듬)

//BoardServiceImpl이 BoardService를 구현함
public interface BoardService {
	
	void insertBoard(List<MultipartFile> multiparts, Board board);

	Map<String, Object> selectBoardByIdx(String bdIdx);

}
