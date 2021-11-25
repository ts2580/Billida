package com.kh.billida.locker.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.locker.model.dto.Locker;

@Mapper
public interface LockerRepository {

	@Select("select * from LOCKER where USER_CODE=#{user_code}") 
	Locker selectUserCode(Long user_code);

	@Insert("insert into LOCKER(LOCKER_ID, USER_CODE, LOCKER_TITLE, LOCKER_CONTENT, LOCKER_IMAGE, LOCKER_SIZE, LOCKER_PASSWORD, LOCATION, RENTABLE_DATE_START, RENTABLE_DATE_END, PROFIT, RENTED_CNT) "
			  + "values(LOCKER_ID.nextval, #{userCode}, #{lockerTitle}, #{lockerContent}, #{lockerImage}, #{lockerSize}, #{lockerPassword}, #{location}, #{rentableDateStart}, #{rentableDateEnd}, #{profit}, RENTED_CNT.nextval )") 
	void insertLocker(Locker locker);

	

	
	  
	  
	
	
	
}