package com.kh.billida.main.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.common.paging.Paging;
import com.kh.billida.main.model.dto.Main;
import com.kh.billida.main.model.repository.MainRepository;

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

	@Override
	public Map<String, Object> selectLockerByKeyword(String search, int page) {
		int cntPerPage = 5;
		
		List<Main> searchList = mainRepository.selectLockerByKeyword(search);
	
			
		return Map.of("searchList", searchList);
	}

	//게시판 페이징
	@Override
	public List<Map<String, Object>> getListPaging(Map<String, Object> commandMap) {
		
		return mainRepository.getListPaging(commandMap);
	}

	//검색 락커 총 갯수
	@Override
	public int getTotal(Criteria cri) {
		return mainRepository.getTotal(cri);
	}



	
	
	

}
