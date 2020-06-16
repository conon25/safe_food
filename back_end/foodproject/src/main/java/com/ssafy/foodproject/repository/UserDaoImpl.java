package com.ssafy.foodproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.foodproject.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	String ns = "ssafy.user.";
	
	@Autowired
	SqlSession sqlSession;
	@Override
	public String getPW(User user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getPassWord", user);
	}

	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		return sqlSession.insert(ns+"insertUser", user) > 0 ? true : false;
	}

	@Override
	public boolean deleteUser(User user) {
		// TODO Auto-generated method stub
		return sqlSession.delete(ns+"deleteUser", user) > 0 ? true : false;
	}

	@Override
	public String getAllergy(User user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getAllergy", user);
	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getUsers", null);
	}

	@Override
	public boolean chkId(String id) {
		// TODO Auto-generated method stub
		if((Integer)sqlSession.selectOne(ns+"chkId", id) == 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public String findPW(String id, String email) {
		// TODO Auto-generated method stub
		User  u = new User(id,null,null,email,null,0);
		List<User> arr = (List)sqlSession.selectList(ns+"findPw",u );
		return arr.get(0).getPw();
	}

	@Override
	public User getUserInfo(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getUserInfo",id);
	}

	@Override
	public void infoUpdate(User user) {
		// TODO Auto-generated method stub
		sqlSession.update(ns+"infoUpdate",user);
	}

	@Override
	public void userDelete(User user) {
		// TODO Auto-generated method stub
		sqlSession.delete(ns+"userDelete",user);
	}

	@Override
	public List<User> userList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getUsers");
	}

	@Override
	public void adminDelete(String id) {
		// TODO Auto-generated method stub
		sqlSession.delete(ns+"adminDelete",id);
	}

	@Override
	public List<User> userListbyId(String value) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"userListbyId", value);
	}

	@Override
	public List<User> userListbyName(String value) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"userListbyName", value);
	}
}
