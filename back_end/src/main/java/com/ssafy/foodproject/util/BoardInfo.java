package com.ssafy.foodproject.util;

import java.util.List;

import com.ssafy.foodproject.model.Board;

public class BoardInfo {
	List<Board> list;
	int pageSize;
	public BoardInfo(List<Board> list, int pageSize) {
		super();
		this.list = list;
		this.pageSize = pageSize;
	}
	public List<Board> getList() {
		return list;
	}
	public void setList(List<Board> list) {
		this.list = list;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
