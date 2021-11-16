package com.kh.billida.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.billida.review.model.dto.RentHistoryAndLocker;

public interface ReviewService {

	RentHistoryAndLocker selectReviews(int historyIndex);

	void insertReview(List<MultipartFile> reviewInfo, RentHistoryAndLocker rentInfo);

}
