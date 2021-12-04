package com.kh.billida.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.main.model.dto.Main;
import com.kh.billida.review.model.dto.RentHistoryAndLocker;
import com.kh.billida.review.model.dto.Review;

public interface ReviewService {

	RentHistoryAndLocker selectRentInfo(int historyIndex);

	List<Integer> findReviewList(String userCode);

	void insertReview(Map<String, Object> commandMap);

	int getRentTotal(String userCode);

	List<Map<String, Object>> getRentListPaging(Map<String, Object> criMap);

	List<Map<String, Object>> getReviewListPaging(Map<String, Object> criMap);

	int getReviewTotal(String userCode);

	RentHistoryAndLocker selectReviewInfo(String reviewNum);

	void modifyReview(Map<String, Object> commandMap);

	void deleteReview(String reviewNum);

	int getHistoryIndex(String reviewNum);

	void updateRentHistoryReviewYn(Map<String, Object> rentHistoryMap);

	List<Map<String, Object>> getMyLockerListPaging(Map<String, Object> criMap);

	int getLockerTotal(String userCode);

	List<Map<String, Object>> getLockerReviewsPaging(Map<String, Object> criMap);

	int getLockerReviewTotal(int lockerId);




}
