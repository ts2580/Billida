package com.kh.billida.member.model.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.member.model.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	private final MemberRepository memberRepository;
	private final RestTemplate http;
	
	
	
	public void insertMember(Member form) {
		memberRepository.insertMember(form);
		
	}

}
