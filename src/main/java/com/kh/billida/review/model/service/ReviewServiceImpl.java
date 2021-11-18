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
	public int getTotal(String userCode) {
		return reviewRepository.getTotal(userCode);
	}

	@Override
	public List<Map<String, Object>> getListPaging(Map<String, Object> criMap) {
		return reviewRepository.getListPaging(criMap);
	}

}
