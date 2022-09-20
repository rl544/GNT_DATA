package com.service.gnt.model.dao;
import com.service.gnt.domain.users.Users;
public interface CommonDAO {
	int createUser(Users user);
	Users getUser(Users user);
	Users getUserByUserId(int userId);
	Users getUserEmailByUserId(Users user);
}
