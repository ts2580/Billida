package com.kh.billida.mileage.model.service;

import java.util.Map;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.mileage.model.dto.Mileage;
import com.kh.billida.mileage.model.dto.MileageHistory;
import com.kh.billida.mileage.model.dto.PaymentDTO;

public interface MileageService {

	void updateMileage(Map<String, Object> commandMap);

	Mileage selectUserMileage(String userCode);

	void insertMileage(Map<String, Object> commandMap);

	void insertPaymentInfo(PaymentDTO paymentDto);

	void insertMileageHistoryInfo(MileageHistory mileageHistory);

	Member selectMemberInfo(String userCode);

}
