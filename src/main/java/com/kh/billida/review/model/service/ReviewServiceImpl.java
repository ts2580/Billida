package com.kh.billida.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.billida.main.model.repository.MainRepository;
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
	public void insertReview(List<MultipartFile> reviewInfo, RentHistoryAndLocker rentInfo) {
		reviewRepository.insertReview(reviewInfo, rentInfo);
		
	}

}
