package com.kh.billida.support.model.service;

import java.util.List;
import java.util.Map;

public interface SupportService {

	void reportInsertPost(Map<String, Object> commandMap);

	List<Map<String, Object>> getReportListPaging(Map<String, Object> reportListMap);

	Map<String, Object> reportDetailPage(String reportIdx);

	List<Map<String, Object>> getReportList(Map<String, Object> reportListMap);
	
	int getSupportTotal();

	
}
