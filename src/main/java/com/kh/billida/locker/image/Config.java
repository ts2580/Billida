package com.kh.billida.locker.image;

public enum Config {

	//DOMAIN("https://pclass.ga"),
	DOMAIN("http://localhost:9090"),
	COMPANY_EMAIL("pclassgyu@gmail.com"),
	STMP_AUTHENTICATION_ID("pclassgyu@gmail.com"),
	SMTP_AUTHENTICATION_PASSWORD("1q2w3e4r1!"),
	UPLOAD_PATH("C:\\CODE\\upload\\"),
	ACCESSKEY("AKIAZTR6CXMEW6Z36NCR"),
	SECRETKEY("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");
	
	public final String DESC;
	
	Config(String desc){
		this.DESC = desc;
	}
	
}