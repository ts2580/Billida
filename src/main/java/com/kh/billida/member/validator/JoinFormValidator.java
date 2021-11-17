package com.kh.billida.member.validator;

import java.util.regex.Pattern;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.billida.member.model.repository.MemberRepository;

@Component
public class JoinFormValidator implements Validator {

	private final MemberRepository memberRepository;

	public JoinFormValidator(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return JoinForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		JoinForm form = (JoinForm) target;
		System.out.println("여긴 조인폼벨리데이터!" + form);
		if (form.getKakaonum() == null) {

			// 1. 아이디 존재 유무
			boolean valid = false;
			if (form.getPassword() != null) {
				if (memberRepository.selectMemberById(form.getId()) != null) {
					errors.rejectValue("Id", "error-Id", "이미 존재하는 아이디입니다.");
				}
				// 2. 비밀번호가 8글자 이상, 숫자 영문자 특수문자 조합인지 확인

				valid = Pattern.matches("(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9]).{8,}", form.getPassword());

				if (!valid) {
					System.out.println("조인폼벨리안임 여기들어와짐?");
					errors.rejectValue("password", "error-password", "비밀번호는 8글자 이상의 숫자 영문자 특수문자 조합입니다.");
				}
			}
			if (form.getPhone() != null) {
				// 3. 전화번호가 9~11 자리의 숫자
				valid = Pattern.matches("^\\d{9,11}$", form.getPhone());
				if (!valid) {
					errors.rejectValue("phone", "error-phone", "전화번호는 9~11자리의 숫자입니다.");
				}
			}
			// 4. 닉네임 존재유무
			if (form.getNick() != null) {
				if (memberRepository.selectMemberByNick(form.getNick()) != null) {
					errors.rejectValue("nick", "error-nick", "이미 존재하는 닉네임입니다.");
				}
			}

		}

	}

}
