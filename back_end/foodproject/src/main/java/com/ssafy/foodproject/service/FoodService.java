package com.ssafy.foodproject.service;

import java.util.List;

import com.ssafy.foodproject.model.Food;
import com.ssafy.foodproject.model.User;

public interface FoodService {
	
	//Food
	public int insert(Food food);
	public List<Food> selectAll();
	public List<Food> pagination(int page);
	public List<Food> searchByName(String name);
	public List<Food> paginationByName(String name, int page);
	public Food searchByCode(int code);
	public List<Food> paginationByCode(int code, int page);
	public List<Food> searchByMaterial(String material);
	public List<Food> paginationByMaterial(String material, int page);
	public List<Food> searchByAllergy(String allergy);
	public List<Food> searchByMaker(String maker);
	public List<Food> paginationByMaker(String Maker, int page);
	public boolean delete(int code);
	public void foodClick(int code);
	public List<String> getWarnMaterial(User user, int code);
	

	
}
