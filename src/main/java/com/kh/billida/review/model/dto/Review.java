package com.kh.billida.review.model.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Review {
	
	private String reviewNum;
	private String userCode;
	private int historyIndex;
	private int lockerId;
	private String content;
	private int score;
	private LocalDate createDate;
	private LocalDate updateDate;
	private String deleteyn;
	

}
