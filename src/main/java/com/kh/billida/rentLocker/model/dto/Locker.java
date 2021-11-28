package com.kh.billida.rentLocker.model.dto;

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
	private float latitude;
	private float longitude;
	private Long rentedCnt;
	private String imgToClob;
	
}
