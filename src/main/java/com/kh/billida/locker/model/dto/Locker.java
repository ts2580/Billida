package com.kh.billida.locker.model.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class Locker {

	private Long locker_id;
	private Long user_code;
	private String locker_title;
	private String locker_content;
	private String locker_image;
	private String locker_size;
	private Long locker_password;
	private String location;
	private Date rentable_date;
	private String rent_end;
	private int profit;
	private long latitude;
	private long longtitude;
	
}
