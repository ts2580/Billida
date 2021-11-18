package com.kh.billida.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.review.model.dto.RentHistoryAndLocker;
import com.kh.billida.review.model.repository.ReviewRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{

	private final ReviewRepository reviewRepository;
	
	@Override
	public RentHistoryAndLocker selectReviews(int historyIndex) {
		return reviewRepository.selectReviews(historyIndex);
	}

	@Override
	public void insertReview(Map<String, Object> commandMap) {
		reviewRepository.insertReview(commandMap);
	}

	@Override
	public List<Integer> findReviewList(String userCoder) {
		return reviewRepository.findReviewList(userCoder);
	}

	@Override
	public int getRentTotal(String userCode) {
		return reviewRepository.getRentTotal(userCode);
	}

	@Override
	public List<Map<String, Object>> getRentListPaging(Map<String, Object> criMap) {
		return reviewRepository.getRentListPaging(criMap);
	}

	@Override
	public List<Map<String, Object>> getReviewListPaging(Map<String, Object> criMap) {
		return reviewRepository.getReviewListPaging(criMap);
	}

	@Override
	public int getReviewTotal(String userCode) {
		return reviewRepository.getReviewTotal(userCode);
	}

}
