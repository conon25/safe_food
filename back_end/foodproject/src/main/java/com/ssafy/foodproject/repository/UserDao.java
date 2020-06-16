package com.ssafy.foodproject.repository;

import java.util.List;

import com.ssafy.foodproject.model.User;

public interface UserDao {

	//User
	public String getPW(User user);//seachById
	public boolean addUser(User user);
	public boolean deleteUser(User user);
	public String getAllergy(User user);
	public List<User> getAllUser();
	public boolean chkId(String id);
	public String findPW(String id, String email);
	public User getUserInfo(String id);
	public void infoUpdate(User user);
	public void userDelete(User u);
	public List<User> userList();
	public void adminDelete(String id);
	public List<User> userListbyId(String value);
	public List<User> userListbyName(String value);
}
