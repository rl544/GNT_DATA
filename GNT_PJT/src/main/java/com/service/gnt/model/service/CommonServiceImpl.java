package com.service.gnt.model.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.service.gnt.domain.users.Users;
import com.service.gnt.model.dao.CommonDAO;
@Service
public class CommonServiceImpl implements CommonService{
	@Autowired
	private CommonDAO commonDAO;
	public int createUser(Users user) {
		return commonDAO.createUser(user);
	}
	public Users getUser(Users user) {
		return commonDAO.getUser(user);
	}
	public Users getUserEmailByUserId(Users user) {
		return commonDAO.getUserEmailByUserId(user);
	}
	public Users getUserByUserId(int userId) {
		return commonDAO.getUserByUserId(userId);
	}	
}
