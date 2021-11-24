package com.kh.billida.support.model.service;

import org.springframework.stereotype.Service;

import com.kh.billida.support.model.dto.Support;
import com.kh.billida.support.model.repository.SupportRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SupportServiceImpl {

	private final SupportRepository supportRepository;
	
	public void reportInsert(Support support) {
		supportRepository.reportInsert(support);
	}
	
}
