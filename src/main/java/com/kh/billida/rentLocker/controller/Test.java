package com.kh.billida.rentLocker.controller;

import java.time.LocalDate;
import java.util.Timer;
import java.util.TimerTask;

public class Test {

	public static void main(String[] args) {

		Timer doBatch = new Timer();
		TimerTask batchhhhhhh = new TimerTask() {
			
			@Override
			public void run() {
				System.out.println("씨이이이이발");
			}
			
		};
		
		doBatch.schedule(batchhhhhhh, 5000);
		
		

	}

}
