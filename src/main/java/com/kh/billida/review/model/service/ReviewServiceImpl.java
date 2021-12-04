package com.kh.billida.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.main.model.dto.Main;
import com.kh.billida.review.model.dto.RentHistoryAndLocker;
import com.kh.billida.review.model.dto.Review;
import com.kh.billida.review.model.repository.ReviewRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{

	private final ReviewRepository reviewRepository;
	
	@Override
	public RentHistoryAndLocker selectRentInfo(int historyIndex) {
		return reviewRepository.selectRentInfo(historyIndex);
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

	@Override
	public RentHistoryAndLocker selectReviewInfo(String reviewNum) {
		return reviewRepository.selectReviewInfo(reviewNum);
	}

	@Override
	public void modifyReview(Map<String, Object> commandMap) {
		reviewRepository.modifyReview(commandMap);
	}

	@Override
	public void deleteReview(String reviewNum) {
		reviewRepository.deleteReview(reviewNum);
	}

	@Override
	public int getHistoryIndex(String reviewNum) {
		return reviewRepository.getHistoryIndex(reviewNum);
	}

	@Override
	public void updateRentHistoryReviewYn(Map<String, Object> rentHistoryMap) {
		reviewRepository.updateRentHistoryReviewYn(rentHistoryMap);
	}

	@Override
	public List<Map<String, Object>> getMyLockerListPaging(Map<String, Object> criMap) {
		return reviewRepository.getMyLockerListPaging(criMap);
	}

	@Override
	public int getLockerTotal(String userCode) {
		return reviewRepository.getLockerTotal(userCode);
	}

	@Override
	public List<Map<String, Object>> getLockerReviewsPaging(Map<String, Object> criMap) {
		return reviewRepository.getLockerReviewsPaging(criMap);
	}

	@Override
	public int getLockerReviewTotal(int lockerId) {
		return reviewRepository.getLockerReviewTotal(lockerId);
	}



}
