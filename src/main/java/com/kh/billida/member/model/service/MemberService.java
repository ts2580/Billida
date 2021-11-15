package com.kh.billida.member.model.service;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.member.validator.JoinForm;


public interface MemberService {

	void insertMember(JoinForm form);	
	Member selectMemberByUserId(String id);
	Member authenticateUser(Member member);
	Member selectMemberByNick(String nick);
	void insertKaKaoMember(JoinForm form);
}