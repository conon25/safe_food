package com.ssafy.foodproject.util;

public class Data {
	String inputValue;
	int page;
	public String getInputValue() {
		return inputValue;
	}
	public void setInputValue(String inputValue) {
		this.inputValue = inputValue;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public Data(String inputValue, int page) {
		super();
		this.inputValue = inputValue;
		this.page = page;
	}

	
}
