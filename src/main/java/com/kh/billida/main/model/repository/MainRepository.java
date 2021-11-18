package com.kh.billida.main.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.main.model.dto.Main;

@Mapper
public interface MainRepository {

	@Select("select locker_image, locker_title, locker_content, locker_size, rentable_date from locker")
	List<Main> selectLockerList();

	List<Map<String, Object>> getListPaging(Map<String, Object> commandMap);
	
	int getTotal(Criteria cri);

}
