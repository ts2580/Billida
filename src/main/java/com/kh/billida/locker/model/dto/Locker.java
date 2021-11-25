package com.kh.billida.locker.model.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class Locker {

	private Long lockerId;
	private String userCode;
	private String lockerTitle;
	private String lockerContent;
	private String lockerImage;
	private String lockerSize;
	private Long lockerPassword;
	private String location;
	private Date rentableDateStart;
	private Date rentableDateEnd;
	private String rentStatus;
	private Long profit;
	private Long latitude;
	private Long longitude;
	private Long rentedCnt;
	
}
