package com.ssafy.foodproject.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.foodproject.model.Food;
import com.ssafy.foodproject.model.User;
import com.ssafy.foodproject.repository.FoodDao;
import com.ssafy.foodproject.repository.UserDao;

@Service
public class FoodServiceImpl implements FoodService{
	
	@Autowired
	private FoodDao foodDaoImpl;
	
	@Autowired
	private UserDao userDaoImpl;
	
	@Override
	public int insert(Food food) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Food> selectAll() {
		// TODO Auto-generated method stub
		return foodDaoImpl.selectAll();
	}

	@Override
	public List<Food> searchByName(String name) {
		// TODO Auto-generated method stub
		return foodDaoImpl.searchByName(name);
	}

	@Override
	public Food searchByCode(int code) {
		// TODO Auto-generated method stub
		return foodDaoImpl.searchByCode(code);
	}

	@Override
	public List<Food> searchByMaterial(String material) {
		// TODO Auto-generated method stub
		return foodDaoImpl.searchByMaterial(material);
	}

	@Override
	public List<Food> searchByAllergy(String allergy) {
		// TODO Auto-generated method stub
		return foodDaoImpl.searchByAllergy(allergy);
	}

	@Override
	public List<Food> searchByMaker(String maker) {
		// TODO Auto-generated method stub
		return foodDaoImpl.searchByMaker(maker);
	}

	@Override
	public boolean delete(int code) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Food> pagination(int page) {
		// TODO Auto-generated method stub
		return foodDaoImpl.pagination(page);
	}

	@Override
	public List<Food> paginationByName(String name, int page) {
		// TODO Auto-generated method stub
		return foodDaoImpl.paginationByName(name, page);
	}

	@Override
	public List<Food> paginationByCode(int code, int page) {
		// TODO Auto-generated method stub
		return foodDaoImpl.paginationByCode(code, page);
	}

	@Override
	public List<Food> paginationByMaterial(String material, int page) {
		// TODO Auto-generated method stub
		return foodDaoImpl.paginationByMaterial(material, page);
	}

	@Override
	public List<Food> paginationByMaker(String maker, int page) {
		// TODO Auto-generated method stub
		return foodDaoImpl.paginationByMaker(maker, page);
	}

	@Override
	public void foodClick(int code) {
		foodDaoImpl.foodClick(code);
	}

	@Override
	public List<String> getWarnMaterial(User user, int code) {
		// TODO Auto-generated method stub
		
		HashSet<String> hs = new HashSet<>();
		List<String> warnMaterials = new ArrayList<String>();
		StringTokenizer st1 = new StringTokenizer(userDaoImpl.getAllergy(user) , ",");
		StringTokenizer st2 = new StringTokenizer(foodDaoImpl.searchByCode(code).getAllergy());
		
		while(st1.hasMoreTokens()) {
			hs.add(st1.nextToken());
		}
		
		while(st2.hasMoreTokens()) {
			String material = st2.nextToken();
			if(hs.contains(material)) warnMaterials.add(material);
		}
		
		
		
		return warnMaterials;
	}

}
