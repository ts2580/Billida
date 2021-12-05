package com.kh.billida.rentalHistory.model.repository;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.billida.rentalHistory.model.dto.LessorMileage;
import com.kh.billida.rentalHistory.model.dto.LockerForLental;
import com.kh.billida.rentalHistory.model.dto.Mileage;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.dto.ReviewForRentHistory;

@Mapper
public interface RentalRepository {

	@Select("select * from locker where LOCKER_ID=#{lockerId}")
	LockerForLental selectLocker(Long param);
	
	@Select("select * from (select * from review inner join member using(user_code) "
			+ "where locker_id = #{lockerId} and deleteyn = 'N' ORDER BY history_index desc) where ROWNUM <= 5 ")
	List<ReviewForRentHistory> selectReview(Long lockerId);
	
	@Select("SELECT MILEAGE FROM MILEAGE WHERE USER_CODE = #{userCode}")
	Long selectRentalMileage(Mileage rantalMileage);
	
	@Update("update member set grade = '00' where user_code = #{userCode}")
	void downGradeMember(String userCode);
	
	@Update("MERGE INTO LOCKER L USING RENT_HISTORY R ON(L.LOCKER_ID = R.LOCKER_ID) "
			+ "WHEN MATCHED THEN UPDATE SET RENT_STATUS = 0 WHERE RENT_END = #{today}")
	void returnBatch(LocalDate today);
	
	@Select(value = "{CALL INSERT_AND_UPDATE_RENTAL(#{lockerId}, #{userCode}, #{rentStart}, #{rentEnd}, #{rentCost})}")
	void insertAndUpdateRental(Rental rental);
	
	@Select(value = "{CALL SELECT_AND_UPDATE_RENTAL_MILEAGE(#{userCode}, #{mileage})}")
	void selectAndUpdateRentalMileage(Mileage RantalMileage);
	
	@Select(value = "{CALL SELECT_AND_UPDATE_LESSOR_MILEAGE(#{lockerId}, #{mileage})}")
	void selectAndUpdateLessorMileage(LessorMileage lessorMileage);

	
	
}
