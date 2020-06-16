package com.ssafy.foodproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.foodproject.model.Board;

@Repository
public class BoardDaoImpl implements BoardDao{

String ns = "ssafy.board.";

@Autowired
SqlSession sqlSession;

@Override
public boolean insertBoard(Board board) {
// TODO Auto-generated method stub
return sqlSession.insert(ns+"insertBoard", board) > 0 ? true : false;
}

@Override
public Board getBoard(int num) {
// TODO Auto-generated method stub
return sqlSession.selectOne(ns+"getBoard", num);
}

@Override
public List<Board> getPage(int page) {
// TODO Auto-generated method stub
return sqlSession.selectList(ns+"getBoardsPage", (page-1)*10);
}

@Override
public int getAllBoardCnt() {
// TODO Auto-generated method stub
return sqlSession.selectOne(ns+"cntAllBoard", null);
}

@Override
public boolean deleteBoard(int num) {
// TODO Auto-generated method stub
return sqlSession.delete(ns+"insertBoard", num) > 0 ? true : false;
}

@Override
public boolean chkBoard(int num) {
// TODO Auto-generated method stub
if((Integer)sqlSession.selectOne(ns+"cntBoard", num) == 0) {
return true;
}else {
return false;
}

}

}

