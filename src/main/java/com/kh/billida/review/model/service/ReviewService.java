package com.kh.billida.review.model.service;

import java.util.Map;

import com.kh.billida.review.model.dto.RentHistoryAndLocker;

public interface ReviewService {

	RentHistoryAndLocker selectReviews(int historyIndex);

	void insertReview(Map<String, Object> commandMap);


}
