package com.kh.billida.member.model.service;

import java.util.List;

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
	List<Member> findIdByEmail(Member member);
	void sendIdByEmail(Member checkUser);
	void updatePassword(JoinForm form);
	void updateName(JoinForm form, Member user);
	void updateNick(JoinForm form, Member user);
	void updateTel(JoinForm form, Member user);
	void updateEmail(JoinForm form, Member user);
	void updateAddress(JoinForm form, Member user);
	List<Member> findPasswordByEmail(Member member);
	void sendPasswordByEmail(Member checkUser, String token);
	void changeKakaoMember(JoinForm form, Member user);
	Member changePasswordByEmail(Member member);
	void updatePasswordByEmail(JoinForm form, Member member);
	List<Member> selectMember();
	Member authenticateUserAndCaptcha(Member member, String getAnswer, String answer);
	void updateGradeUpById(String id);
	void updateGradeDownById(String id);
	Member selectMileageInfo(String id);
	List<Member> selectMemberByEmail(String email);
	void authenticateByEmail(JoinForm form, String token);

}