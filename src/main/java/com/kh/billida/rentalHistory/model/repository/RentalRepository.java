package com.kh.billida.rentalHistory.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.rentalHistory.model.dto.LockerForLent;
import com.kh.billida.rentalHistory.model.dto.Rental;

@Mapper
public interface RentalRepository {

	
	@Insert("insert into rent_history(HISTORY_INDEX, LOCKER_ID, USER_CODE, RENT_START, RENT_END, RENT_COST, RENT_PIC) "
			+ "values(#{historyIndex}, #{lockerId}, #{userCode}, #{rentStart}, #{rentEnd}, #{rentCost}, #{rentPic})")
	void insertRental(Rental rental);
	// 대여번호-시퀸스/택배함번호-메인에서 파라미터로 가져오기/유저코드- 세션에서 가져오기 
	
	@Select("select * from locker where LOCKER_ID=#{locker_id}")
	LockerForLent selectLocker(int param);
	
}
