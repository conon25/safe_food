package com.ssafy.foodproject.service;

import java.util.List;

import com.ssafy.foodproject.model.Eat;
import com.ssafy.foodproject.model.Food;
import com.ssafy.foodproject.model.User;
import com.ssafy.foodproject.util.EatData;
import com.ssafy.foodproject.util.MyeatData;

public interface MyeatService {
	
	public List<EatData> getPageMyeats(String id, int page);
	public List<Food> getAllMyeats(String id);
	public String getUser(User id);
	public int cntFood(int foodCode, String userId);
	public boolean updtFoodCnt(int foodCode, String userId);
	public boolean addFood(int foodCode, String userId);
	public List<Boolean> chkAllergy(User user, List<Food> foods);
	public boolean distinctCount(String id , int code); // 肄붾뱶媛� �씠誘� �뱾�뼱媛� �엳�뒗吏� 議고쉶.
	public boolean deleteFood(String id , int code);
	public List<Eat> getAll(String id);
	
}
