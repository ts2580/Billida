package com.kh.billida.rentLocker.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.billida.rentLocker.model.dto.Locker;



@Mapper
public interface RentLockerRepository {
	
	@Insert("insert into locker(LOCKER_ID, USER_CODE, LOCKER_TITLE, LOCKER_CONTENT, LOCKER_IMAGE, LOCKER_SIZE, LOCKER_PASSWORD, RENTABLE_DATE_START, RENTABLE_DATE_END)"
			+ "values(LOCKER_ID.nextval, #{userCode}, #{lockerTitle}, #{lockerContent}, #{lockerImage}, #{lockerSize}, #{lockerPassword}, #{rentableDateStart}, #{rentableDateEnd})")
	void insertLocker(Locker locker);
		
}