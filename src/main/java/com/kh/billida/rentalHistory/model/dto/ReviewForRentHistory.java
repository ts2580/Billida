package com.kh.billida.rentalHistory.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewForRentHistory {
	
	private String userCode;
	private String nick;
	private int lockerId;
	private float score;
	private Date createDate;
	private Date updateDate;
	private String content;

}
