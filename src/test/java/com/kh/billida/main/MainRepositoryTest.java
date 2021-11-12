package com.kh.billida.main;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.main.model.dto.Main;

@Mapper
public interface MainRepositoryTest {
	
	@Insert("insert into locker(locker_id, user_code, locker_title, locker_content, locker_size, locker_password, latitude, longitude, rentable_date)"
			+ " values(locker_id.nextval,#{userCode}, #{lockerTitle}, #{lockerContent}, #{lockerSize}, #{lockerPassword}, #{latitude}, #{longitude}, #{rentableDate})")
	int insertWithDto(Main main);
	
	@Insert("insert into locker(locker_id, user_code, locker_title, locker_content, locker_size, locker_password, latitude, longitude, location, rentable_date)"
			+ " values(locker_id.nextval,#{userCode}, #{lockerTitle}, #{lockerContent}, #{lockerSize}, #{lockerPassword}, #{latitude}, #{longitude}, #{location}, #{rentableDate})")
	int insertinsertDummyApi(Main main);
	
	
	

	@Select("select * from locker")
	List<Main> lockers();
	
}
