package com.kh.billida.support.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.billida.member.validator.JoinForm;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.support.model.dto.Support;

@Mapper
public interface SupportRepository {

	@Insert
	("insert into report_board(REPORT_IDX, USER_ID, REPORT_TITLE, REPORT_CONTENT, REPORT_DATE, REPORT_RESULT)"
	+ " values(REPORT_IDX.nextval, #{userId}, #{reportTitle}, #{reportContent}, #{reportDate}, '0')")
	void reportInsertPost(Map<String, Object> commandMap);

	List<Map<String, Object>> getSupportListPaging(Map<String, Object> commandMap);

	
	
	/*
	 * @Insert
	 * ("insert into member(user_code,id,password,name,nick,phone,post_code,address,address_detail,email,grade)"
	 * + " values(USER_CODE.nextval,#{id},#{password},#{name},#{nick}" +
	 * ",#{phone},#{postCode},#{address},#{addressDetail},#{email},'01')") void
	 * insertMember(JoinForm form);
	 * 
	 * @Insert("insert into rent_history(HISTORY_INDEX, LOCKER_ID, USER_CODE, RENT_START, RENT_END, RENT_COST) "
	 * +
	 * "values(RENT_HISTORY_INDEX.nextval, #{lockerId}, #{userCode}, #{rentStart}, #{rentEnd}, #{rentCost})"
	 * ) void insertRental(Rental rental); // 대여번호-시퀸스/택배함번호-메인에서 파라미터로 가져오기/유저코드-
	 * 세션에서 가져오기
	 */	
}
