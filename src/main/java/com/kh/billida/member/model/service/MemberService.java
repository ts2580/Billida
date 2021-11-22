package com.kh.billida.member.model.service;

import javax.servlet.http.HttpSession;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.member.validator.JoinForm;


public interface MemberService {

	void insertMember(JoinForm form);	
	Member selectMemberById(String id);
	Member authenticateUser(Member member);
	Member selectMemberByNick(String nick);
	void updateMember(JoinForm form);
	boolean checkPassword(String password, HttpSession session);
	void deleteMember(String userCode);
	Member findIdByEmail(Member member);
	void sendIdByEmail(Member checkUser);

}