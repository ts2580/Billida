package com.kh.billida.member.model.dto;

import lombok.Data;

@Data
public class Member {
	
	private String Id;
	private String user_code;
	private String password;
	private String name;
	private String nick;
	private int phone;
	private String address;
	private String email;
	private int kakao_num;
	private String grade;
	private int mileage;
	private long member_X;
	private long member_Y;
}
