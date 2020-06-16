package com.ssafy.foodproject.repository;
import java.util.List;

import com.ssafy.foodproject.model.Eat;
import com.ssafy.foodproject.model.Food;
import com.ssafy.foodproject.util.EatData;

public interface MyeatDao {
	
	public List<Food> getPageMyeats(String id, int page);
	public List<Food> getAllMyeats(String id);
	public int cntFood(int foodCode, String userId);
	public boolean updtFoodCnt(int foodCode, String userId);
	public boolean addFood(int foodCode, String userId);
	public boolean distinctCount(String id , int code);
	public boolean deleteFood(String id , int code);
	public List<Eat> getAll(String id);
	
}
