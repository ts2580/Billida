package com.kh.billida.locker.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.kh.billida.locker.model.dto.Locker;
import com.kh.billida.locker.model.repository.LockerRepository;
import com.kh.billida.main.model.repository.MainRepository;
import com.webjjang.util.PageObject;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class LockerServiceImpl implements LockerService{

	private final LockerRepository lockerRepository;
	
	@Override
	public List<Locker> imageList(PageObject pageObject){

		log.info("pageObject : " + pageObject);
		
		//전체 데이터의 개수 구하기
		//데이터를 가져와서 리턴한다.
		return null;
	}
	
}
