package com.kh.spring.member.model.service;

import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.spring.common.code.Config;
import com.kh.spring.common.mail.MailSender;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.member.model.repository.MemberRepository;
import com.kh.spring.member.validator.JoinForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService { //프록시패턴으로 사용하기 위해 인터페이스 구현?

	private final MemberRepository memberRepository;
	private final MailSender mailSender;
	private final RestTemplate http;
	private final PasswordEncoder passwordEncoder;

	public void insertMember(JoinForm form) {
		form.setPassword(passwordEncoder.encode(form.getPassword())); //폼으로 받아온 비밀번호 인코딩해서 다시 넣어주기
		memberRepository.insertMember(form);
	}

	public Member authenticateUser(Member member) {
		Member storedMember = memberRepository.selectMemberByUserId(member.getUserId());
		
		if(storedMember != null && passwordEncoder.matches(member.getPassword(), storedMember.getPassword())) { //사용자가 입력한 값과 디비에 저장되어 있는 패스워드 비교
			return storedMember;
		}
		
		return null;
	}

	public Member selectMemberByUserId(String userId) {
		return memberRepository.selectMemberByUserId(userId);
	}

	public void authenticateByEmail(JoinForm form, String token) {
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("mailTemplate", "join-auth-mail");
		body.add("userId", form.getUserId());
		body.add("persistToken", token);
		
		//http통신을 위해 RequestEntity 사용
		//RestTemplate의 기본 Content-type : applicaion/json
		RequestEntity<MultiValueMap<String, String>> request = 
				RequestEntity.post(Config.DOMAIN.DESC + "/mail")
				.accept(MediaType.APPLICATION_FORM_URLENCODED)
				.body(body);
	
		String htmlTxt = http.exchange(request, String.class).getBody();
		mailSender.send(form.getEmail(), "회원가입을 축하합니다.", htmlTxt);
	}
	
	
}
