package com.kh.billida.member.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.billida.member.common.code.Config;
import com.kh.billida.member.common.mail.MailSender;
import com.kh.billida.member.model.dto.Member;
import com.kh.billida.member.model.repository.MemberRepository;
import com.kh.billida.member.validator.JoinForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberRepository memberRepository;
	private final PasswordEncoder passwordEncoder;
	private final MailSender mailSender;
	private final RestTemplate http;

	public void insertMember(JoinForm form) {
		if (form.getKakaonum() == null) {
			form.setPassword(passwordEncoder.encode(form.getPassword()));
			memberRepository.insertMember(form);
		} else {
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

		if (storedMember != null && passwordEncoder.matches(member.getPassword(), storedMember.getPassword())) {
			return storedMember;
		} else if (storedMember.getKakaoNum() != null) {
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

	public Member findIdByEmail(Member member) {
		System.out.println("여까지는 옵니까?");
		System.out.println("멤버서비스임플에서 멤버값" + member);
		Member storedMember = memberRepository.selectMemberByNameAndEmail(member.getName(), member.getEmail());
		System.out.println("저장된값" + storedMember);
		if (storedMember == null) {
			return null;
		}
		return storedMember;
	}

	public void sendIdByEmail(Member checkUser) {
		System.out.println("메일보내러왔떠영ㅁ 뿌우~!");
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("mailTemplate", "mail");
		body.add("Id", checkUser.getId());
		RequestEntity<MultiValueMap<String, String>> request = RequestEntity.post(Config.DOMAIN.DESC + "/mail")
				.accept(MediaType.APPLICATION_FORM_URLENCODED).body(body);

		String htmlTxt = http.exchange(request, String.class).getBody();
		mailSender.send(checkUser.getEmail(), "회원가입을 축하합니다", htmlTxt);

	}

	@Override
	public boolean checkPassword(String password, HttpSession session) {

		Member storedMember = memberRepository.selectMemberById((String) session.getAttribute("Id"));

		if (passwordEncoder.matches(password, storedMember.getPassword())) {
			return true;
		} else {
			return false;
		}
	}


}
