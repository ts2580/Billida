package com.kh.billida.rentalHistory.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.rentalHistory.model.dto.LockerForLent;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.dto.ReviewForRentHistory;

@Mapper
public interface RentalRepository {

	@Select("select * from locker where LOCKER_ID=#{lockerId}")
	LockerForLent selectLocker(Long param);
	
	@Insert("insert into rent_history(HISTORY_INDEX, LOCKER_ID, USER_CODE, RENT_START, RENT_END, RENT_COST) "
			+ "values(RENT_HISTORY_INDEX.nextval, #{lockerId}, #{userCode}, #{rentStart}, #{rentEnd}, #{rentCost})")
	void insertRental(Rental rental);
	// 대여번호-시퀸스/택배함번호-메인에서 파라미터로 가져오기/유저코드- 세션에서 가져오기 
	
	@Select("select * from (select * from review inner join member using(user_code) "
			+ "where locker_id = #{lockerId} ORDER BY history_index desc) where ROWNUM <= 5")
	List<ReviewForRentHistory> selectReview(Long lockerId);
	
	
}
