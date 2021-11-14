package com.kh.billida.main.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.main.model.dto.Main;

@Mapper
public interface MainRepository {

	@Select("select * from locker")
	List<Main> selectLockerList();

	@Select("select * from locker where locker_title like '%'||#{keyword}||'%' or locker_content like '%'||#{keyword}||'%' or location like '%'||#{keyword}||'%'")
	List<Main> selectLockerByKeyword(String search);

	@Select("select count(*) from locker where locker_title like '%'||#{keyword}||'%' or locker_content like '%'||#{keyword}||'%' or location like '%'||#{keyword}||'%'")
	int selectcountList(String search);

	List<Map<String, Object>> getListPaging(Map<String, Object> commandMap);
	
	int getTotal(Criteria cri);

}
