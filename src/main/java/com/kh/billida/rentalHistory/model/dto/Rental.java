package com.kh.billida.rentalHistory.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Rental {
	
	private Long historyIndex;
	private Long lockerId;
	private String userCode;
	private Date rentStart;
	private Date rentEnd;
	private Long rentCost;
	private String rentPic;

}
