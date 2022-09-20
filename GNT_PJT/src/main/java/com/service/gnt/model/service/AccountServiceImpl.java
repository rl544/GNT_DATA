package com.service.gnt.model.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.model.dao.AccountDAO;
@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountDAO accountDAO;
	public Account createAccount(int userId, String accPassword, String userNameEng,
			String address, String phone) {
		return accountDAO.createAccount(userId, accPassword, userNameEng, address, phone);
	}
	public int getAccountBalance(String accId) {
		return accountDAO.getAccountBalance(accId);
	}
	public int depositAccount(int userId, int amount) {
		return accountDAO.depositAccount(userId, amount);
	}
	public String sendAccount(int userId, int amount, String accId) {
		return accountDAO.sendAccount(userId, amount, accId);
	}
	public int createMileage(int userId) {
		return accountDAO.createMileage(userId);
	}
	public int getMileageBalance(int userId) {
		return accountDAO.getMileageBalance(userId);
	}
	public List<MileageHistory> getMileageHistory(int userId) {
		return accountDAO.getMileageHistory(userId);
	}
	public MileageHistory addMileage(int amount, int userId) {
		return accountDAO.addMileage(amount, userId);
	}
	public Account getAccount(String accId) {
		return accountDAO.getAccount(accId);
	}
	public String checkUserAccount(int userId) {
		return accountDAO.checkUserAccount(userId);
	}
	public Account getAccountByUserId(int userId) {
		return accountDAO.getAccountByUserId(userId);
	}
	public int getMileageHistoryCount(int userId) {
		return accountDAO.getMileageHistoryCount(userId);
	}
	public String getAccIdByUserId(int userId) {
		return accountDAO.getAccIdByUserId(userId);
	}
	public String checkUserAccPasword(int userId, String accPassword) {
		return accountDAO.checkUserAccPasword(userId, accPassword);
	}
}
