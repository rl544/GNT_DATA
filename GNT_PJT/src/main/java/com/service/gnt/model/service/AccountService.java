package com.service.gnt.model.service;
import java.util.List;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
public interface AccountService {
	Account createAccount(int userId, String accPassword, String userNameEng, String address, String phone);
	int getAccountBalance(String accId);
	int depositAccount(int userId, int amount);
	String sendAccount(int userId, int amount, String accId);
	int createMileage(int userId);
	int getMileageBalance(int userId);
	List<MileageHistory> getMileageHistory(int userId);
	MileageHistory addMileage(int amount, int userId);
	Account getAccount(String accId);
	String checkUserAccount(int userId);
	Account getAccountByUserId(int userId);
	int getMileageHistoryCount(int userId);
	String getAccIdByUserId(int userId);
	String checkUserAccPasword(int userId, String accPassword);
}
