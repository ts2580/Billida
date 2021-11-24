package com.kh.billida.support.model.dto;

import lombok.Data;

@Data
public class Support {
	
	private int reportIdx;
	private String userCode;
	private String reportTitle;
	private String reportContent;
	private String reportDate;
	private String reportResult;

}
