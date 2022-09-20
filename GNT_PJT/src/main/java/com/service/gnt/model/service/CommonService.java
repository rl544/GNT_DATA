package com.service.gnt.model.service;
import com.service.gnt.domain.users.Users;
public interface CommonService {
	int createUser(Users user);
	Users getUser(Users user);
	Users getUserByUserId(int userId);
	Users getUserEmailByUserId(Users user);
}
