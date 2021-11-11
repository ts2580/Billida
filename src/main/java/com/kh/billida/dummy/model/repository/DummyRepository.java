package com.kh.billida.dummy.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.billida.dummy.model.dto.Dummy;

@Mapper
public interface DummyRepository {
	
	@Insert("insert into locker(locker_id, user_code, locker_title, locker_content, locker_size, location, latitude, longitude)"
			+ " values(loker_id.nextval,userCode, lockerTitle, locketContent, lockerSize, location, latitude, longitude)")
	void insertDummyData(Dummy dummy);

}
