package com.kh.billida.support.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.billida.support.model.dto.Support;

@Mapper
public interface SupportRepository {

	@Insert("insert into report_board()")
	void reportInsert(Support support);

}
