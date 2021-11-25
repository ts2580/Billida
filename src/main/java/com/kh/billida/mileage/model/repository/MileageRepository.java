package com.kh.billida.mileage.model.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.billida.mileage.model.dto.Mileage;

@Mapper
public interface MileageRepository {

	@Update("update mileage set mileage = mileage + #{mileage} where user_code = #{userCode}")
	void updateMileage(Map<String, Object> commandMap);

	@Select("select * from mileage where user_code = #{userCode}")
	Mileage selectUserMileage(String userCode);

	@Insert("insert into mileage(user_code, mileage) values(#{userCode}, #{mileage})")
	void insertMileage(Map<String, Object> commandMap);

}
