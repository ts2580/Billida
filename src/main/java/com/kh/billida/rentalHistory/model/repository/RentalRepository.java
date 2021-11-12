package com.kh.billida.rentalHistory.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import com.kh.billida.rentalHistory.model.dto.Rental;

@Mapper
public interface RentalRepository {

	
	@Insert("insert into rent_history(HISTORY_INDEX, LOCKER_ID, USER_CODE, RENT_START, RENT_END, RENT_COST, RENT_PIC) "
			+ "values(#{historyIndex}, #{lockerId}, #{userCode}, #{rentStart}, #{rentEnd}, #{rentCost}, #{rentPic})")
	void insertRental(Rental rental);
	
}
