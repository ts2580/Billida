package com.kh.billida.support.model.service;

import java.util.List;
import java.util.Map;

import com.kh.billida.support.model.dto.Support;

public interface SupportService {

	void reportInsertPost(Map<String, Object> commandMap);

	List<Map<String, Object>> getSupportListPaging(Map<String, Object> commandMap);

	Map<String, Object> reportDetailPage(String userId);

	List<Map<String, Object>> getReportList(Map<String, Object> reportListMap);
	
	int getSupportTotal();

	
}
