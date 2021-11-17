package com.kh.billida.review.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.billida.review.model.dto.RentHistoryAndLocker;
import com.kh.billida.review.model.dto.Review;

public interface ReviewService {

	RentHistoryAndLocker selectReviews(int historyIndex);

	void insertReview(Map<String, Object> commandMap);


}
