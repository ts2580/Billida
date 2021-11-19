
package com.kh.billida.locker.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.billida.locker.model.dto.Locker;

@Service
public interface LockerService {

	//리스트
	public List<Locker> imageList();

	public void appendAttach(String[] uploadedFiles, Integer bno);

	public void removeAttach(String fileName);
	
	//보기
	
	//등록
	
	//수정
	
	//사진 수정
	
	//삭제
	
	
	
	/*
	 * void uploadImage(Locker locker); void deleteImage(String fileName);
	 */
}

