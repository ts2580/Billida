package com.kh.billida.main.model.service;

import java.util.List;
import java.util.Map;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.main.model.dto.Main;
import com.kh.billida.member.model.dto.Member;

public interface MainService {

	List<Main> selectLockerList(Object lockerId);

	List<Map<String, Object>> getListPaging(Map<String, Object> commandMap);
	
	int getTotal(Criteria cri);

	Member isDegraded(String userCode);

	List<Object> getLockerIds();


}
