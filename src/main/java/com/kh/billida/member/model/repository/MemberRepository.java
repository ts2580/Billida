package com.kh.billida.member.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.billida.member.model.dto.Member;

@Mapper
public interface MemberRepository {

	@Insert ("insert into member(user_code,id,password,name,nick,phone,address,email,grade)"
			+ " values(USER_CODE.nextval, #{Id},#{password},#{name},#{nick},#{phone},#{address},#{email},'01'")
	void insertMember(Member member);
}
