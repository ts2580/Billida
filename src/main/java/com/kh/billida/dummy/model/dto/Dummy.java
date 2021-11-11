package com.kh.billida.dummy.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Dummy {
	
	private int lockerId;
	private String userCode;
	private String lockerTitle;
	private String lockerContent;
	private String lockerImage;
	private String lockerSize;
	private int lockerPassword;
	private String location;
	private Date rentableDate;
	private String rentEnd;
	private String latitude;
	private String longitude;

}
