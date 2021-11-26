package com.kh.billida.mileage.model.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.mileage.model.dto.Mileage;
import com.kh.billida.mileage.model.dto.MileageHistory;
import com.kh.billida.mileage.model.dto.PaymentDTO;

@Mapper
public interface MileageRepository {

	@Update("update mileage set mileage = mileage + #{mileage} where user_code = #{userCode}")
	void updateMileage(Map<String, Object> commandMap);

	@Select("select * from mileage where user_code = #{userCode}")
	Mileage selectUserMileage(String userCode);

	@Insert("insert into mileage(user_code, mileage) values(#{userCode}, #{mileage})")
	void insertMileage(Map<String, Object> commandMap);

	@Insert("insert into payment(user_code, mileage, order_num) values(#{userCode}, #{mileage}, #{orderNum})")
	void insertPaymentInfo(PaymentDTO paymentDto);

	@Insert("insert into mileage_history(user_code, mileage, order_num, plus_minus) values(#{userCode}, #{mileage}, #{orderNum}, 'plus')")
	void insertMileageHistoryInfo(MileageHistory mileageHistory);

	@Select("select m.*, e.mileage from member m, mileage e where m.user_code = #{userCode}")
	Member selectMemberInfo(String userCode);

}
