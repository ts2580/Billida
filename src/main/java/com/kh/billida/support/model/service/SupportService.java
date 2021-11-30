package com.kh.billida.support.model.service;

import java.util.List;
import java.util.Map;

import com.kh.billida.common.paging.Paging;
import com.kh.billida.support.model.dto.Support;

public interface SupportService {

	void reportInsertPost(Map<String, Object> commandMap);

	List<Map<String, Object>> getReportListPaging(Map<String, Object> criMap);

	Map<String, Object> reportDetailPage(String reportIdx);

	List<Map<String, Object>> getReportList(Map<String, Object> reportListMap);
	
	int getSupportTotal();

	List<Support> selectPage(Paging paging);

	void reportAddResult();

	List<Map<String, Object>> getListPagingforSearch(Map<String, Object> criMap);

	
}
