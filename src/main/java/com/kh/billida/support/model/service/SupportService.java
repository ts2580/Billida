package com.kh.billida.support.model.service;

import java.util.List;
import java.util.Map;

public interface SupportService {

	void reportInsertPost(Map<String, Object> commandMap);

	List<Map<String, Object>> getSupportListPaging(Map<String, Object> commandMap);

	Map<String, Object> reportDetailPage(String userId);

	int getSupportTotal();
}
