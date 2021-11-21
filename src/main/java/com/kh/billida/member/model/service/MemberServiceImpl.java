package com.kh.billida.member.model.service;

import javax.servlet.http.HttpSession;

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
		   if(form.getKakaonum()==null) {
		   form.setPassword(passwordEncoder.encode(form.getPassword()));
		   memberRepository.insertMember(form);
		   }else {
			   System.out.println("이걸로가야댐");
			   memberRepository.insertkakaoMember(form);
			   System.out.println("나와야댐");
		   }
		   }
	   public Member selectMemberById(String id) {
		      return memberRepository.selectMemberById(id);
		  }
	   public Member selectMemberByNick(String nick) {
		      return memberRepository.selectMemberByNick(nick);
		  }

	   public Member authenticateUser(Member member) {
		      Member storedMember = memberRepository.selectMemberById(member.getId());
		      
		      if(storedMember!=null&&passwordEncoder.matches(member.getPassword(), storedMember.getPassword())) {
		         return storedMember;
		      }else if(storedMember.getKakaoNum()!=null) {
		    	  return storedMember;
		      }
		      
		      return null;
		      
		   }
		public void updateMember(JoinForm form) {
			 memberRepository.updateMember(form);
		}
		public void deleteMember(String userCode) {
			memberRepository.deleteMember(userCode);
			
		}
	
	@Override
	public boolean checkPassword(Member member, HttpSession session) {
		Member storedMember = memberRepository.selectMemberById((String)session.getAttribute("Id"));
		System.out.println(storedMember.toString());
		System.out.println(member.getPassword());
		if(passwordEncoder.matches(member.getPassword(), storedMember.getPassword())) {
			return true;
		}
		return false;
	}
	@Override
	public void findIdByEmail(Object object) {
		// TODO Auto-generated method stub
		
	}

	   
}


