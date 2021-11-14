package com.kh.billida.member.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.member.validator.JoinForm;

@Mapper
public interface MemberRepository {

	@Insert ("insert into member(user_code,id,password,name,nick,phone,post_code,address,address_detail,email,grade)"
			+ " values(USER_CODE.nextval,#{id},#{password},#{name},#{nick}"
			+ ",#{phone},#{postCode},#{address},#{addressDetail},#{email},'01')")
	void insertMember(JoinForm form);
	
	@Select("select * from member where id = #{id}")
	Member selectMemberByUserId(String id);
	
	@Select("select * from member where id = #{Id} and password = #{password}")
	Member authenicateUser(Member member);
}
