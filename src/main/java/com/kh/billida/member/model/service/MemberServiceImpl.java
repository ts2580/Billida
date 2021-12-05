package com.kh.billida.member.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.cache.CacheKey;
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

	public List<Member> selectMemberByEmail(String email) {
		return memberRepository.selectMemberByEmail(email);
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

	public void changeKakaoMember(JoinForm form, Member user) {
		System.out.println("멤버값" + user);
		if (form.getName() == null) {
			form.setName(user.getName());
		}
		if (form.getName() == null) {
			form.setNick(user.getNick());
		}
		if (form.getName() == null) {
			form.setPhone(user.getPhone());
		}
		if (form.getName() == null) {
			form.setEmail(user.getEmail());
		}
		if (form.getName() == null) {
			form.setAddress(user.getAddress());
		}
		if (form.getName() == null) {
			form.setAddressDetail(user.getAddressDetail());
		}
		if (form.getName() == null) {
			form.setPostCode(user.getPostCode());
		}
		memberRepository.updateMember(form);
	}

	public void deleteMember(String userCode) {
		memberRepository.deleteMember(userCode);

	}

	public List<Member> findIdByEmail(Member member) {
		System.out.println("여까지는 옵니까?");
		System.out.println("멤버서비스임플에서 멤버값" + member);
		List<Member> storedMember = memberRepository.selectMemberByNameAndEmail(member.getName(), member.getEmail());
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
		body.add("name", checkUser.getName());
		body.add("address", checkUser.getAddress());
		RequestEntity<MultiValueMap<String, String>> request = RequestEntity.post(Config.DOMAIN.DESC + "/mail")
				.accept(MediaType.APPLICATION_FORM_URLENCODED).body(body);

		String htmlTxt = http.exchange(request, String.class).getBody();
		mailSender.send(checkUser.getEmail(), "아이디 찾기", htmlTxt);

	}

	public List<Member> findPasswordByEmail(Member member) {
		System.out.println("여기는 서비스임플입니당 여기서 넘어온 멤버값은 ? : " + member);
		List<Member> storedMember = memberRepository.selectMemberByIdAndNameAndEmail(member.getId(), member.getName(),
				member.getEmail());
		System.out.println("디비에서 꺼내온값" + storedMember);
		if (storedMember == null) {
			return null;
		}
		return storedMember;
	}

	public void sendPasswordByEmail(Member checkUser, String token) {
		System.out.println("메일보내러왔떠영ㅁ 뿌우~!");
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("mailTemplate", "mail");
		body.add("Id", checkUser.getId());
		body.add("name", checkUser.getName());
		body.add("check", "체크");
		body.add("persistToken", token);
		System.out.println(checkUser.getAddress());
		RequestEntity<MultiValueMap<String, String>> request = RequestEntity.post(Config.DOMAIN.DESC + "/mail")
				.accept(MediaType.APPLICATION_FORM_URLENCODED).body(body);

		String htmlTxt = http.exchange(request, String.class).getBody();
		mailSender.send(checkUser.getEmail(), "비밀번호 찾기", htmlTxt);
	}
	public void authenticateByEmail(JoinForm form, String token) {
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("mailTemplate", "mail");
		body.add("NewId", form.getId());
		body.add("persistToken", token);

		RequestEntity<MultiValueMap<String, String>> request = RequestEntity.post(Config.DOMAIN.DESC + "/mail")
				.accept(MediaType.APPLICATION_FORM_URLENCODED).body(body);

		String htmlTxt = http.exchange(request, String.class).getBody();
		mailSender.send(form.getEmail(), "회원가입을 환영합니다.", htmlTxt);
	}
	public Member changePasswordByEmail(Member member) {
		Member authMember = memberRepository.selectMemberById(member.getId());
		System.out.println("반환하는 멤버값");
		return authMember;
	}

	public void updatePasswordByEmail(JoinForm form, Member member) {
		form.setId(member.getId());
		form.setPassword(passwordEncoder.encode(form.getPassword()));
		System.out.println("서비스임플에서 변경된 폼값 아이디값이 적용되야함 " + form);
		memberRepository.updatepasswordByEmail(form);
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

	public void updatePassword(JoinForm form) {
		form.setPassword(passwordEncoder.encode(form.getPassword()));
		memberRepository.updatePassword(form);

	}

	public void updateName(JoinForm form, Member member) {
		form.setId(member.getId());
		System.out.println("이까지오긴함?ㅋㅋ" + form);
		memberRepository.updateName(form);
	}

	public void updateNick(JoinForm form, Member member) {
		form.setId(member.getId());
		memberRepository.updateNick(form);

	}

	public void updateTel(JoinForm form, Member member) {
		form.setId(member.getId());
		memberRepository.updateTel(form);

	}

	public void updateEmail(JoinForm form, Member member) {
		form.setId(member.getId());
		memberRepository.updateEmail(form);

	}

	public void updateAddress(JoinForm form, Member member) {
		form.setId(member.getId());
		memberRepository.updateAddress(form);

	}

	@Override
	public List<Member> selectMember() {
		return memberRepository.selectMember();

	}

	public Member authenticateUserAndCaptcha(Member member, String getAnswer, String answer) {
		System.out.println("멤버서비스임플입니다" + getAnswer.equals(answer));
		Member storedMember = memberRepository.selectMemberById(member.getId());

		if (storedMember != null && passwordEncoder.matches(member.getPassword(), storedMember.getPassword())
				&& getAnswer.equals(answer)) {
			return storedMember;
		}
		return null;
	}

	@Override
	public void updateGradeUpById(String id) {
		System.out.println("등급올라가는중");
		memberRepository.updateGradeUpById(id);
	}

	@Override
	public void updateGradeDownById(String id) {
		System.out.println("등급떨어지는중");
		memberRepository.updateGradeDownById(id);
	}

	public Member selectMileageInfo(String id) {
		return memberRepository.selectMileageInfo(id);

	}


}
