package com.kh.billida.member.model.dto;

import lombok.Data;

@Data
public class Member {
	
	private String id;
	private String userCode;
	private String password;
	private String name;
	private String nick;
	private String phone;
	private String postCode;
	private String address;
	private String addressDetail;
	private String email;
	private String kakaoNum;
	private String grade;
	private int mileage;
	private long member_X;
	private long member_Y;
	
}
