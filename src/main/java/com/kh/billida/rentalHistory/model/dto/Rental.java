package com.kh.billida.rentalHistory.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Rental {
	
	private long historyIndex;
	private int lockerId;
	private String userCode;
	private Date rentStart;
	private Date rentEnd;
	private int rentCost;
	private String rentPic;

}
