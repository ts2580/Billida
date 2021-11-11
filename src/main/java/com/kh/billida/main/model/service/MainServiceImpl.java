package com.kh.billida.main.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

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

	
	
	

}
