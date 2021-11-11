package com.kh.billida.dummy.model.service;

import org.springframework.stereotype.Service;

import com.kh.billida.dummy.model.dto.Dummy;
import com.kh.billida.dummy.model.repository.DummyRepository;
import com.kh.billida.main.model.repository.MainRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DummyServiceImpl {

	private final DummyRepository dummyRepository;
	
	public void insertDummyData(Dummy dummy) {
		dummyRepository.insertDummyData(dummy);
	}
}
