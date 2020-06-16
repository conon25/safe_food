package com.ssafy.foodproject.util;

import java.util.List;

import com.ssafy.foodproject.model.Eat;
import com.ssafy.foodproject.model.Food;
import com.ssafy.foodproject.model.User;

public class Profile {
	User user;
	List<EatData> foodData;

	public Profile(User user, List<EatData> foodData) {
		super();
		this.user = user;
		this.foodData = foodData;
	}
	public Profile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<EatData> getFoodData() {
		return foodData;
	}
	public void setFoodData(List<EatData> foodData) {
		this.foodData = foodData;
	}
	
	
}
