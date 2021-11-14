package com.kh.billida.member.model.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.member.model.repository.MemberRepository;
import com.kh.billida.member.validator.JoinForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	private final MemberRepository memberRepository;
	private final PasswordEncoder passwordEncoder;

	
	
	   public void insertMember(JoinForm form) {
		      form.setPassword(passwordEncoder.encode(form.getPassword()));
		      memberRepository.insertMember(form);
		   }
	   public Member selectMemberByUserId(String id) {
		      return memberRepository.selectMemberByUserId(id);
		  }
	   public Member selectMemberByNick(String nick) {
		      return memberRepository.selectMemberByUserId(nick);
		  }
	   
	@Override
	public Member authenicateUser(Member member) {
		
		return memberRepository.authenicateUser(member);
	}

}
