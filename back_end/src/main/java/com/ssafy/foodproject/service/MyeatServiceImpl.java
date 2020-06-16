package com.ssafy.foodproject.service;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.foodproject.model.Eat;
import com.ssafy.foodproject.model.Food;
import com.ssafy.foodproject.model.User;
import com.ssafy.foodproject.repository.MyeatDao;
import com.ssafy.foodproject.repository.MyeatDaoImpl;
import com.ssafy.foodproject.repository.UserDao;
import com.ssafy.foodproject.repository.UserDaoImpl;
import com.ssafy.foodproject.util.EatData;
import com.ssafy.foodproject.util.MyeatData;

@Service
public class MyeatServiceImpl implements MyeatService {
	
	@Autowired
	private MyeatDao dao;
	@Autowired
	private UserDao dao2;

	// single tone
	@Override
	public List<Food> getAllMyeats(String id) {
		return dao.getAllMyeats(id);
	}
	@Override
	public List<EatData> getPageMyeats(String id, int page) {
		List<Food> f = dao.getPageMyeats(id, page);
		List<EatData> ed = new ArrayList<EatData>();
		for (int i = 0; i < f.size(); i++) {
		ed.add(new EatData(f.get(i),cntFood(f.get(i).getCode(), id)));
		}
		return ed;
	}
	
	


	@Override
	public String getUser(User user) {
		// TODO Auto-generated method stub
		return dao2.getAllergy(user);
	}

	@Override
	public List<Boolean> chkAllergy(User user, List<Food> foods) {
		// TODO Auto-generated method stub
		String userAllergy = dao2.getAllergy(user);
		List<Boolean> res = new ArrayList<>();
		for(Food f:foods) {
			HashSet<String> hs = new HashSet<>();
			StringTokenizer st = new StringTokenizer(f.getAllergy()," ");
			for(;st.hasMoreTokens();) {
				hs.add(st.nextToken());
			}
			
			StringTokenizer st2 = new StringTokenizer(userAllergy,",");
			boolean chk = true;
			for(;st2.hasMoreTokens();) {
				if(hs.contains(st2.nextToken())) {
					//not safe!!!
					chk = false;
					break;
				}
				
			}
			res.add(chk);//safe allergy
		}
		
		return res;
	}

	public boolean addFood(int foodCode, String userId) {
		return dao.addFood(foodCode,userId);
	}

	@Override
	public boolean distinctCount(String id, int code) {
		return dao.distinctCount(id, code);
	}

	@Override
	public boolean deleteFood(String id, int code) {
		return dao.deleteFood(id, code);
	}

	@Override
	public int cntFood(int foodCode, String userId) {
		// TODO Auto-generated method stub
		return dao.cntFood(foodCode, userId);
	}

	@Override
	public boolean updtFoodCnt(int foodCode, String userId) {
		// TODO Auto-generated method stub
		return dao.updtFoodCnt(foodCode, userId);
	}

	@Override
	public List<Eat> getAll(String id) {
		// TODO Auto-generated method stub
		return dao.getAll(id);
	}

}