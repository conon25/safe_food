package com.ssafy.foodproject.service;

import java.util.List;

import com.ssafy.foodproject.model.Board;

public interface BoardService {
public boolean insertBoard(Board board);
public Board getBoard(int num);
public List<Board> getPage(int page);
public int getAllBoardCnt();
public boolean deleteBoard(int num);
public boolean chkBoard(int num);
}