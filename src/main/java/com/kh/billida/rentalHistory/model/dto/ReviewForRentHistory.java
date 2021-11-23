package com.kh.billida.rentalHistory.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewForRentHistory {
	
	private String userCode;
	private int lockerId;
	private int score;
	private Date createDate;
	private Date updateDate;
	private String content;

}
