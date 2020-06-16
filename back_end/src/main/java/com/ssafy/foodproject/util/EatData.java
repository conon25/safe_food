package com.ssafy.foodproject.util;

import com.ssafy.foodproject.model.Food;

public class EatData {
	Food food;
	int count;
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public EatData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EatData(Food food, int count) {
		super();
		this.food = food;
		this.count = count;
	}
}
