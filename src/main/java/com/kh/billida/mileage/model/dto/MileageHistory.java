package com.kh.billida.mileage.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MileageHistory {
	
	private String userCode;
	private String orderNum;
	private String mileage;
	private String plusMinus;

}
