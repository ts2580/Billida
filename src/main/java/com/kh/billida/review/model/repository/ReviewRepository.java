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

	int getRentTotal(String userCode);

	List<Map<String, Object>> getRentListPaging(Map<String, Object> criMap);
	
	List<Map<String, Object>> getReviewListPaging(Map<String, Object> criMap);

	@Select("select count(*) from review where user_code = #{userCode}")
	int getReviewTotal(String userCode);



	
}
