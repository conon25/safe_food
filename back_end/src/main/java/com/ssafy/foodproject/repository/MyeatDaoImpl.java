package com.ssafy.foodproject.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.foodproject.model.Eat;
import com.ssafy.foodproject.model.Food;
import com.ssafy.foodproject.model.User;
import com.ssafy.foodproject.util.Data;
import com.ssafy.foodproject.util.EatData;
import com.ssafy.foodproject.util.MyeatData;

@Repository
public class MyeatDaoImpl implements MyeatDao {

	String ns = "ssafy.myeat.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Food> getPageMyeats(String id, int page) {
		// TODO Auto-generated method stub
		Data data = new Data(id, (page-1)*6);
		return sqlSession.selectList(ns+"getPageMyeats", data);
	}
	
	@Override
	public List<Food> getAllMyeats(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getAllMyeats", id);
	}

	@Override
	public boolean addFood(int foodCode, String userId) {
		// TODO Auto-generated method stub
		MyeatData myeatData = new MyeatData(foodCode,userId);
		return sqlSession.insert(ns+"addFood", myeatData) > 0 ? true : false;
	}

	@Override
	public boolean distinctCount(String id, int code) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteFood(String id, int code) {
		// TODO Auto-generated method stub
		
		return sqlSession.delete(ns+"deleteFood",new MyeatData(code, id))>0 ? true: false; 
	}

	@Override
	public int cntFood(int foodCode, String userId) {
		// TODO Auto-generated method stub
		MyeatData myeatData = new MyeatData(foodCode, userId);
		List<Integer> num = sqlSession.selectList(ns+"cntFood", myeatData);
		
		if(num.isEmpty()) 
			return 0;
		else 
			return num.get(0);
		
		
	}

	@Override
	public boolean updtFoodCnt(int foodCode, String userId) {
		// TODO Auto-generated method stub
		MyeatData myeatData = new MyeatData(foodCode, userId);
		return sqlSession.update(ns+"updtFoodCnt", myeatData) > 0 ? true : false;
	}
	
	@Override
	public List<Eat> getAll(String id) {
		return sqlSession.selectList(ns+"getAll",id);
	}
	
	
}