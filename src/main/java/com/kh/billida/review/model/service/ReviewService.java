package com.kh.billida.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;


import com.kh.billida.member.model.dto.Member;
import com.kh.billida.review.model.dto.RentHistoryAndLocker;
import com.kh.billida.review.model.dto.Review;

public interface ReviewService {

	List<RentHistoryAndLocker> selectReviews(int historyIndex);

	List<Integer> findReviewList(String userCode);

	void insertReview(Map<String, Object> commandMap);


}
