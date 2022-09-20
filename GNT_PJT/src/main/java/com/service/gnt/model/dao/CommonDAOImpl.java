package com.service.gnt.model.dao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.service.gnt.domain.users.Users;
@Repository
public class CommonDAOImpl implements CommonDAO{
	
private final static String NS = "ns.sql.UserMapper.";
	@Autowired
	private SqlSession sqlSession;
	public int createUser(Users user) {
		int returnInt = sqlSession.insert(NS+"insertUser", user);
		return returnInt;
	}
	public Users getUser(Users user) {
		return sqlSession.selectOne(NS+"selectUser",user);
	}
	public Users getUserEmailByUserId(Users user) {
		return sqlSession.selectOne(NS+"selectUserEmail",user);
	}
	public Users getUserByUserId(int userId) {
		return sqlSession.selectOne(NS+"selectAccIdByUserId",userId);
	}
}
