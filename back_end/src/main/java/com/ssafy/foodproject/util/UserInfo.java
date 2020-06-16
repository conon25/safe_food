package com.ssafy.foodproject.util;

import java.util.List;

import com.ssafy.foodproject.model.User;

public class UserInfo {
	List<User> list;
	int pageSize;
	public UserInfo(List<User> foods, int pageSize) {
		super();
		this.list = foods;
		this.pageSize = pageSize;
	}
	public List<User> getList() {
		return list;
	}
	public void setList(List<User> list) {
		this.list = list;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
