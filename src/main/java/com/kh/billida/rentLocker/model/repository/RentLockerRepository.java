package com.kh.billida.rentLocker.model.repository;

import java.time.LocalDate;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.billida.rentLocker.model.dto.Locker;



@Mapper
public interface RentLockerRepository {
	
	@Insert("insert into locker(LOCKER_ID, USER_CODE, LOCKER_TITLE, LOCKER_CONTENT, "
			+ "IMG_TO_CLOB, LOCKER_SIZE, LOCKER_PASSWORD, LOCATION, RENTABLE_DATE_START, RENTABLE_DATE_END, LATITUDE, LONGITUDE)"
			+ "values(LOCKER_ID.nextval, #{userCode}, #{lockerTitle}, #{lockerContent}, EMPTY_CLOB(), #{lockerSize}, "
			+ "#{lockerPassword}, #{location}, #{rentableDateStart}, #{rentableDateEnd}, #{latitude}, #{longitude})")
	void insertLocker(Locker locker);
	
	@Select("select * from (select * from locker ORDER BY LOCKER_ID desc) where ROWNUM = 1")
	Long selectInsertedLocker();
	
	@Update("update locker set IMG_TO_CLOB = #{imgToClob} where LOCKER_ID = #{lockerId}")
	void insertClob(Locker locker);

	@Update("update locker set RENT_STATUS = 3 where RENTABLE_DATE_END = #{today}")
	void returnBatch(LocalDate today);

	
		
}