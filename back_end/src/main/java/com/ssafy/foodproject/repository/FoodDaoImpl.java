package com.ssafy.foodproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.foodproject.model.Food;
import com.ssafy.foodproject.util.Data;

@Repository
public class FoodDaoImpl implements FoodDao{
	
	String ns = "ssafy.food.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Food> selectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getFoods", null);
	}

	@Override
	public List<Food> searchByName(String name) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getFoodsByName", name);
	}

	@Override
	public Food searchByCode(int code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getFoodsByCode", code);
	}

	@Override
	public List<Food> searchByMaterial(String material) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getFoodsByMaterial", material);
	}

	@Override
	public List<Food> searchByAllergy(String allergy) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getFoodsByAllergy", allergy);
	}

	@Override
	public List<Food> searchByMaker(String maker) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getFoodsByMaker", maker);
	}


	@Override
	public List<Food> pagination(int page) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getPageFoods", (page-1)*6);
	}

	@Override
	public List<Food> paginationByName(String name, int page) {
		// TODO Auto-generated method stub
		Data data = new Data(name, (page-1)*6);
		return sqlSession.selectList(ns+"getPageFoodsByName", data);
	}

	@Override
	public List<Food> paginationByCode(int code, int page) {
		// TODO Auto-generated method stub
		Data data = new Data(code+"", (page-1)*6);
		return sqlSession.selectList(ns+"getPageFoodsByCode", data);
	}

	@Override
	public List<Food> paginationByMaterial(String material, int page) {
		// TODO Auto-generated method stub
		Data data = new Data(material, (page-1)*6);
		return sqlSession.selectList(ns+"getPageFoodsByMaterial", data);
	}

	@Override
	public List<Food> paginationByMaker(String maker, int page) {
		// TODO Auto-generated method stub
		Data data = new Data(maker, (page-1)*6);
		return sqlSession.selectList(ns+"getPageFoodsByMaker", data);
	}

	public void foodClick(int code) {
		sqlSession.update(ns+"foodClick",code);
	}
}
