package com.kh.billida.review.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.review.model.dto.RentHistoryAndLocker;

@Mapper
public interface ReviewRepository {
	
	RentHistoryAndLocker selectReviews(int historyIndex);

	void insertReview(Map<String, Object> commandMap);

	@Select("select history_index from rent_history where user_code = #{userCode}")
	List<Integer> findReviewList(String userCode);

	@Select("select count(*) from rent_history where user_code = #{userCode}")
	int getTotal(String userCode);

	List<Map<String, Object>> getListPaging(Map<String, Object> criMap);


	
}
