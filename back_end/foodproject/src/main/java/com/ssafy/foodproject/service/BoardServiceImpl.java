package com.ssafy.foodproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.foodproject.model.Board;
import com.ssafy.foodproject.repository.BoardDao;

@Service
public class BoardServiceImpl implements BoardService{

@Autowired
BoardDao boardDao;

@Override
public boolean insertBoard(Board board) {
// TODO Auto-generated method stub
return boardDao.insertBoard(board);
}

@Override
public Board getBoard(int num) {
// TODO Auto-generated method stub
return boardDao.getBoard(num);
}

@Override
public List<Board> getPage(int page) {
// TODO Auto-generated method stub
return boardDao.getPage(page);
}

@Override
public boolean deleteBoard(int num) {
// TODO Auto-generated method stub
return boardDao.deleteBoard(num);
}

@Override
public boolean chkBoard(int num) {
// TODO Auto-generated method stub
return boardDao.chkBoard(num);
}

@Override
public int getAllBoardCnt() {
// TODO Auto-generated method stub
return boardDao.getAllBoardCnt();
}

}