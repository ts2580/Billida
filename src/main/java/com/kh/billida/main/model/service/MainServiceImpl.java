package com.kh.billida.main.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.common.paging.Paging;
import com.kh.billida.main.model.dto.Main;
import com.kh.billida.main.model.repository.MainRepository;
import com.kh.billida.member.model.dto.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {
	
	private final MainRepository mainRepository;

	@Override
	public List<Main> selectLockerList() {
		List<Main> mainList = mainRepository.selectLockerList();
		return mainList;
	}

	//게시판 페이징
	@Override
	public List<Map<String, Object>> getListPaging(Map<String, Object> commandMap) {
		List<Map<String,Object>> lockers = mainRepository.getListPaging(commandMap);
		return lockers;
	}

	//검색 락커 총 갯수
	@Override
	public int getTotal(Criteria cri) {
		return mainRepository.getTotal(cri);
	}
	
	// 부정유저 감지
	public Member isDegraded(String userCode) {
		return mainRepository.isDegraded(userCode);
	}



	
	
	

}
