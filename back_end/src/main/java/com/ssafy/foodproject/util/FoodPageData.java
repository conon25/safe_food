package com.ssafy.foodproject.util;

import java.util.List;

import com.ssafy.foodproject.model.Food;

public class FoodPageData {
	int pageSize;
	List<Food> foods;
	
	public FoodPageData(int pageSize, List<Food> foods) {
		super();
		this.pageSize = pageSize;
		this.foods = foods;
	}

	
	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public List<Food> getFoods() {
		return foods;
	}


	public void setFoods(List<Food> foods) {
		this.foods = foods;
	}


	@Override
	public String toString() {
		return "FoodPageData [pageSize=" + pageSize + ", foods=" + foods + "]";
	}
	
	
	
}
