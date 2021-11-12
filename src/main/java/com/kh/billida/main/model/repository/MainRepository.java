package com.kh.billida.main.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.main.model.dto.Main;

@Mapper
public interface MainRepository {

	@Select("select * from locker where locker_id = '9'")
	List<Main> selectLockerList();

}
