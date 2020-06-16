package com.ssafy.foodproject.repository;

import java.util.List;

import com.ssafy.foodproject.model.Food;

public interface FoodDao {
	
	//Food
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
	public List<Food> paginationByMaker(String maker, int page);
	public void foodClick(int code);
	

}
