package com.kh.billida.main.model.dto;

import java.sql.Date;
import java.time.LocalDate;

import lombok.Data;

@Data
public class Main {
	
	private int lockerId; //택배함 고유번호
	private String userCode;
	private String lockerTitle; //택배함 이름
	private String lockerContent; //도로명 주소
	private String lockerImage; //이미지
	private String lockerSize; //사이즈
	private int lockerPassword; //비밀번호
	private String location; //세부안내
	private LocalDate rentableDate; //임대가능일자
	private String rentEnd; //임대종료
	private String latitude; //위도
	private String longitude; //경도

}
