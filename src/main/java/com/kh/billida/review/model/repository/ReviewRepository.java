package com.kh.billida.review.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.billida.review.model.dto.RentHistoryAndLocker;
import com.kh.billida.review.model.dto.Review;

@Mapper
public interface ReviewRepository {
	
	RentHistoryAndLocker selectRentInfo(int historyIndex);

	void insertReview(Map<String, Object> commandMap);

	@Select("select history_index from rent_history where user_code = #{userCode}")
	List<Integer> findReviewList(String userCode);

	@Select("select count(*) from rent_history where user_code = #{userCode}")

	int getRentTotal(String userCode);

	List<Map<String, Object>> getRentListPaging(Map<String, Object> criMap);
	
	List<Map<String, Object>> getReviewListPaging(Map<String, Object> criMap);

	@Select("select count(*) from review where user_code = #{userCode} and deleteyn = 'N'")
	int getReviewTotal(String userCode);

	Map<String, Object> selectReviewInfo(String reviewNum);

	void modifyReview(Map<String, Object> commandMap);

	@Update("update review set deleteyn = 'Y' where review_num = #{reviewNum}")
	void deleteReview(String reviewNum);

	@Select("select * from review where user_code = #{userCode}")
	List<Review> getUserReviews(String userCode);

	@Select("select history_index from review where review_num = #{reviewNum}")
	int getHistoryIndex(String reviewNum);

	@Update("update rent_history set review_yn = #{yn} where history_index = #{historyIndex}")
	void updateRentHistoryReviewYn(Map<String, Object> rentHistoryMap);

	List<Map<String, Object>> getMyLockerListPaging(Map<String, Object> criMap);

	@Select("select count(*) from locker where user_code = #{userCode}")
	int getLockerTotal(String userCode);

	List<Map<String, Object>> getLockerReviewsPaging(Map<String, Object> criMap);

	@Select("select count(*) from review where locker_id = #{lockerId}")
	int getLockerReviewTotal(int lockerId);

	
}
