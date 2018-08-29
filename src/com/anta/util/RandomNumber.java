package com.anta.util;

import java.util.Random;

public class RandomNumber {
	public static String intNumber(){
		Random random = new Random();
		return String.valueOf(random.nextInt(1)*100000);
	}
}
