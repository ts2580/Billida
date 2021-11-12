package com.kh.billida.main.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.main.model.dto.Main;

@Mapper
public interface MainRepository {

	@Select("select * from locker")
	List<Main> selectLockerList();

	@Select("select * from locker where locker_title like '%'||#{search}||'%' or locker_content like '%'||#{search}||'%' or location like '%'||#{search}||'%'")
	List<Main> selectLockerByKeyword(String search);

	@Select("select count(*) from locker where locker_title like '%'||#{search}||'%' or locker_content like '%'||#{search}||'%' or location like '%'||#{search}||'%'")
	int selectcountList(String search);

}
