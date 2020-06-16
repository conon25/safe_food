package com.ssafy.foodproject.util;

import java.util.List;

import com.ssafy.foodproject.model.Food;

public class FoodDetailData {
	Food food;
	List<String> warnMaterials;
	public FoodDetailData(Food food, List<String> warnMaterials) {
		super();
		this.food = food;
		this.warnMaterials = warnMaterials;
	}
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	public List<String> getWarnMaterials() {
		return warnMaterials;
	}
	public void setWarnMaterials(List<String> warnMaterials) {
		this.warnMaterials = warnMaterials;
	}
	
}
