package com.kh.billida.member.common.code;

public enum Config {
	DOMAIN("https://www.billida.xyz/"),
	COMPANY_EMAIL("billida1940@gmail.com"),
	SMTP_AUTHENTICATION_ID("billida1940@gmail.com"),
	SMTP_AUTHENTICATION_PASSWORD("123456tr!@#"),
	UPLOAD_PATH("C:\\CODE\\upload\\");
	
	public final String DESC;
	
	Config(String desc){
		this.DESC=desc;
	}
}