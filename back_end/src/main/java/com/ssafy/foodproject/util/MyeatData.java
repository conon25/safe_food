package com.ssafy.foodproject.util;

public class MyeatData {
	
	String userId;
	int foodCode;
	public MyeatData(int foodCode, String userId) {
		super();
		this.userId = userId;
		this.foodCode = foodCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getFoodCode() {
		return foodCode;
	}
	public void setFoodCode(int foodCode) {
		this.foodCode = foodCode;
	}
	
	
}
