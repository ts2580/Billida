package com.kh.billida.mileage.model.dto;

import lombok.Data;

@Data
public class Mileage {
	
	private String userCode;
	private int mileage;
	private int accountNum;
	private String bankType;

}
