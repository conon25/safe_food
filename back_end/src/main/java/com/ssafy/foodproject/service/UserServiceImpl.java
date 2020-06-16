package com.ssafy.foodproject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.foodproject.model.User;
import com.ssafy.foodproject.repository.FoodDaoImpl;
import com.ssafy.foodproject.repository.UserDao;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDaoImpl;

	@Override
	public boolean login(User user) {
		if (user.getPw().equals(userDaoImpl.getPW(user))) {
			return true;
		}
		return false;
	}

	@Override
	public boolean addUser(User user) {
		if(userDaoImpl.chkId(user.getId())) {
			userDaoImpl.addUser(user);
			return true;
		}
		
		return false;
	}

	@Override
	public String getPW(User user) {
		// TODO Auto-generated method stub
		return userDaoImpl.getPW(user);
	}

	@Override
	public boolean updateUser(User user) {
		if(userDaoImpl.deleteUser(user)) {
			return true;
		};
		if(userDaoImpl.addUser(user)) {
			return true;
		};
		return false;
	}

	@Override
	public String getAllergy(User user) {
		// TODO Auto-generated method stub
		return userDaoImpl.getAllergy(user);
	}

	@Override
	public boolean chkId(String id) {
		// TODO Auto-generated method stub
		return userDaoImpl.chkId(id);
	}

	@Override
	public String findPW(String id, String email) {
		// TODO Auto-generated method stub
		return userDaoImpl.findPW(id, email);
	}

	@Override
	public User getUserInfo(String id) {
		// TODO Auto-generated method stub
		return userDaoImpl.getUserInfo(id);
	}

	@Override
	public void infoUpdate(User user) {
		// TODO Auto-generated method stub
		userDaoImpl.infoUpdate(user);
	}

	@Override
	public void userDelete(User u) {
		// TODO Auto-generated method stub
		userDaoImpl.userDelete(u);
	}

	@Override
	public List<User> userList() {
		// TODO Auto-generated method stub
		return userDaoImpl.userList();
	}

	@Override
	public void adminDelete(String id) {
		// TODO Auto-generated method stub
		userDaoImpl.adminDelete(id);
	}

	@Override
	public List<User> userListbyId(String value) {
		// TODO Auto-generated method stub
		return userDaoImpl.userListbyId(value);
	}

	@Override
	public List<User> userListbyName(String value) {
		// TODO Auto-generated method stub
		return userDaoImpl.userListbyName(value);
	}

	@Override
	public List<User> getPageUser(String id, int page) {
		return userDaoImpl.getPageUser(id,page);
	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return userDaoImpl.countAll();
	}

	
}
