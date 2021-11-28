package com.kh.billida.rentLocker.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.billida.rentLocker.model.dto.Locker;



@Mapper
public interface RentLockerRepository {
	
	@Insert("insert into locker(LOCKER_ID, USER_CODE, LOCKER_TITLE, LOCKER_CONTENT, "
			+ "IMG_TO_BLOB, LOCKER_SIZE, LOCKER_PASSWORD, LOCATION, RENTABLE_DATE_START, RENTABLE_DATE_END, LATITUDE, LONGITUDE)"
			+ "values(LOCKER_ID.nextval, #{userCode}, #{lockerTitle}, #{lockerContent}, #{imgToBlob}, #{lockerSize}, "
			+ "#{lockerPassword}, #{location}, #{rentableDateStart}, #{rentableDateEnd}, #{latitude}, #{longitude})")
	void insertLocker(Locker locker);
		
}