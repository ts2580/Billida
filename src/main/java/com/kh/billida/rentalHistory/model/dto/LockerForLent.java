package com.kh.billida.rentalHistory.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class LockerForLent {
	
	private int lockerId;
	private int userCode;
	private String lockerTitle;
	private String lockerContent;
	private String lockerImage;
	private String lockerSize;
	private Long lockerPassword;
	private String location;
	private Date rentableDate;
	private String rentEnd;

}
