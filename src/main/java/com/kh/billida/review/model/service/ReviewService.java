package com.kh.billida.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.review.model.dto.RentHistoryAndLocker;

public interface ReviewService {

	RentHistoryAndLocker selectReviews(int historyIndex);

	List<Integer> findReviewList(String userCode);

	void insertReview(Map<String, Object> commandMap);

	int getTotal(String userCode);

	List<Map<String, Object>> getListPaging(Map<String, Object> criMap);


}
