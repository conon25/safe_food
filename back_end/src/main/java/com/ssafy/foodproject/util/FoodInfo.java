package com.ssafy.foodproject.util;

import java.util.List;

import com.ssafy.foodproject.model.Board;
import com.ssafy.foodproject.model.Food;

public class FoodInfo {
	List<Food> list;
	int pageSize;
	public FoodInfo(List<Food> foods, int pageSize) {
		super();
		this.list = foods;
		this.pageSize = pageSize;
	}
	public List<Food> getList() {
		return list;
	}
	public void setList(List<Food> list) {
		this.list = list;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
