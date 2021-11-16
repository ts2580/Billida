package com.kh.billida.review.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.billida.review.model.dto.RentHistoryAndLocker;

@Mapper
public interface ReviewRepository {
	
	RentHistoryAndLocker selectReviews(int historyIndex);

	
}
