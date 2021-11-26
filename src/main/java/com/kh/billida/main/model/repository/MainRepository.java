package com.kh.billida.main.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.main.model.dto.Main;
import com.kh.billida.member.model.dto.Member;

@Mapper
public interface MainRepository {

	@Select("select user_code, locker_id, locker_image, locker_title, locker_content, locker_size, rentable_date_end from locker")
	List<Main> selectLockerList();

	List<Map<String, Object>> getListPaging(Map<String, Object> commandMap);
	
	int getTotal(Criteria cri);
	
	@Select("select grade from member where user_code = #{userCode}")
	Member isDegraded(String userCode);

}
