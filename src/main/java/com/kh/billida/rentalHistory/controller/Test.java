package com.kh.billida.rentalHistory.controller;

import java.time.LocalDate;

public class Test {

	public static void main(String[] args) {

		LocalDate Someday = LocalDate.of(2021, 11, 30);
		
		LocalDate Someday2 = LocalDate.of(2022, 04, 05);
		
		System.out.println(Someday.getDayOfYear());
		System.out.println(Someday2.getDayOfYear());

	}

}
