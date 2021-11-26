package com.kh.billida.support.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.billida.support.model.dto.Support;
import com.kh.billida.support.model.repository.SupportRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SupportServiceImpl implements SupportService {

	private final SupportRepository supportRepository;

	@Override
	public void reportInsertPost(Map<String, Object> commandMap) {
		supportRepository.reportInsertPost(commandMap);
		
	}
	
	@Override
	public List<Map<String, Object>> getSupportListPaging(Map<String, Object> commandMap) {
		return supportRepository.getSupportListPaging(commandMap);
	}

	@Override
	public Map<String, Object> reportDetailPage(String userId) {
		Support support = supportRepository.reportDetailPage(userId);
		return Map.of("support",support);
	}
}
