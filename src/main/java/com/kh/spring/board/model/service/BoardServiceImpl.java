package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.repository.BoardRepository;
import com.kh.spring.common.code.ErrorCode;
import com.kh.spring.common.exception.HandlableException;
import com.kh.spring.common.util.file.FileDTO;
import com.kh.spring.common.util.file.FileUtil;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{ 

	private final BoardRepository boardRepository;
	
	public void insertBoard(List<MultipartFile> multiparts, Board board) {
		boardRepository.insertBoard(board);
		
		FileUtil util = new FileUtil();
		for (MultipartFile multipartFile : multiparts) {
			if(!multipartFile.isEmpty()) { //첨부파일이 비어있지 않을때만
				boardRepository.insertFileInfo(util.fileUpload(multipartFile)); //파일정보 집어넣기(파일 업로드)
			}
		}
	}

	@Override
	public Map<String, Object> selectBoardByIdx(String bdIdx) {
		Board board = boardRepository.selectBoardByIdx(bdIdx); //게시글 가져오기
		List<FileDTO> files = boardRepository.selectFilesByBdIdx(bdIdx); //파일목록 가져옴
		
		return Map.of("board", board, "files", files);
	}
	
}
