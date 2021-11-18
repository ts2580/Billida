package com.kh.billida.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.review.model.dto.RentHistoryAndLocker;

public interface ReviewService {

	RentHistoryAndLocker selectReviews(int historyIndex);

	List<Integer> findReviewList(String userCode);

	void insertReview(Map<String, Object> commandMap);

	int getRentTotal(String userCode);

	List<Map<String, Object>> getRentListPaging(Map<String, Object> criMap);

	List<Map<String, Object>> getReviewListPaging(Map<String, Object> criMap);

	int getReviewTotal(String userCode);


}
