package com.ssafy.foodproject.service;

import java.util.List;

import com.ssafy.foodproject.model.User;

public interface UserService {
	//User
	public boolean login(User user);
	public boolean addUser(User user);
	public String getPW(User user);
	public boolean updateUser(User user);
	public String getAllergy(User user);
	public boolean chkId(String id);
	public String findPW(String id, String email);
	public User getUserInfo(String id);
	public void infoUpdate(User user);
	public void userDelete(User u);
	public List<User> userList();
	public void adminDelete(String id);
	public List<User> userListbyId(String value);
	public List<User> userListbyName(String value);
	public List<User> getPageUser(String id, int page);
	public int countAll();
}
