package com.anta.util;

import org.apache.struts2.ServletActionContext;

public class SendPhoneCode {
	private static String code ;
	public String send(String phone){
		return code;
	}
	public SendPhoneCode() {
		code = String.valueOf((int)((Math.random()*9+1)*100000));
		// TODO Auto-generated constructor stub
	}
	public static String getCode(){
		code = String.valueOf((int)((Math.random()*9+1)*100000));
		return code;
	}
	
}
