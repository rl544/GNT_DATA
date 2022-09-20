package com.service.gnt.model.dao;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.domain.users.Users;
@Repository
public class AccountDAOImpl implements AccountDAO {
	public final static String AM = "ns.sql.AccountMapper.";
	private final static String UM = "ns.sql.UserMapper.";
	@Autowired
	private SqlSession sqlSession;
	private CommonDAO commonDAO;
	public Account createAccount(int userId, String accPassword, String userNameEng, String address,
			String phone) {
		String key = getAccIdByUserId(userId);
		if(key==null || key.equals("")) {
			key = "";
			while (true) {
				key = sqlSession.selectOne(AM + "createAccKey");
				if (sqlSession.selectOne(AM + "validateAccId", key).equals("0")) {
					break; // 난수생성한 계좌가 겹치지 않을 경우 실행
				}
			}
			sqlSession.insert(AM + "insertAccount", new Account(key, accPassword));
		} else {
			sqlSession.update(AM+"updateAccPassword", new Account(key, accPassword));
		}
		Users vo = new Users(userId, key, userNameEng, address, phone);
		sqlSession.update(UM + "updateUserInfo", vo); // user 정보 추가부
		return getAccount(key);
	}
	public int getAccountBalance(String accId) {
		return sqlSession.selectOne(AM + "selectAccountAmount", accId);
	}
	public int depositAccount(int userId, int amount) {
		return sqlSession.update(AM + "updateAccountAmount", new Account(getAccIdByUserId(userId), amount, 0));
	}
	public String sendAccount(int userId, int amount, String accId) {
		String mainId = getAccIdByUserId(userId);
		String data = "no";
		int out = amount * -1;
		if (getAccountBalance(mainId) >= amount) {
			sqlSession.update(AM + "updateAccountAmount", new Account(mainId, out, 0));
			sqlSession.update(AM + "updateAccountAmount", new Account(accId, amount, 0));
			data = "yes";
		} else {
//			System.out.println("계좌에 잔고가 부족합니다.");
		}
		return data;
	}
	public int createMileage(int userId) {
		String accId = sqlSession.selectOne(UM+"selectAccIdByUserId",userId);
//		System.out.println(accId);
		return sqlSession.insert(AM + "updateAccountIsMileage", accId);
	}
	public int getMileageBalance(int userId) {
		String accId = getAccIdByUserId(userId);
		return sqlSession.selectOne(AM + "selectMileage", accId);
	}
	public Account getAccount(String accId) {
		return sqlSession.selectOne(AM+"selectAccount",accId);
	}
	public Account getAccountByUserId(int userId) {
		return getAccount(getAccIdByUserId(userId));
	}
	public String getAccIdByUserId(int userId) {
		return sqlSession.selectOne(UM+"selectAccIdByUserId",userId);
	}
	public List<MileageHistory> getMileageHistory(int userId) {
		return sqlSession.selectList(AM + "selectMileageHistory", getAccIdByUserId(userId));
	}
	public MileageHistory addMileage(int type, int userId) {
		int amount = 0;
		int bonus = 0;
		String accId = sqlSession.selectOne(UM+"selectAccIdByUserId",userId);
		switch(type) {
		case 1:
			amount = 10000;
			break;
		case 2:
			amount = 30000;
			bonus = 3000;
			break;
		case 3:
			amount = 50000;
			bonus = 5000;
			break;
		case 4:
			amount = 100000;
			bonus = 10000;
			break;
		default :
			break;
		}
		if (getAccountBalance(accId) >= amount) {
			int out = amount * -1;
			int total = amount + bonus;
			String message = "생성";
			if(total>0) message="충전";
			sqlSession.update(AM + "updateAccountAmount", new Account(accId, out, 0));
			sqlSession.update(AM + "updateMileage", new Account(accId, 0, total));
			sqlSession.insert(AM+"insertMileageHistory", new MileageHistory(accId,total,message));
			return sqlSession.selectOne(AM+"selectLastMileageHistory", accId);
		} else {
//			System.out.println("잔액이 부족합니다.");
			return null;
		}
	}
	public String checkUserAccount(int userId) {
		String str = "no";
		int data = sqlSession.selectOne(AM+"selectAccIdExistancy",userId);
		if(data==0) str = "no";
		else str = "yes";
		return str;
	}
	public int getMileageHistoryCount(int userId) {
		String accId = sqlSession.selectOne(UM+"selectAccIdByUserId",userId);
		return sqlSession.selectOne(AM+"selectMileageHistoryCount",accId);
	}
	public String checkUserAccPasword(int userId, String accPassword) {
		String str = "no";
		String accId = sqlSession.selectOne(UM+"selectAccIdByUserId",userId);
		int data = sqlSession.selectOne(AM+"checkAccountPassword",new Account(accId,accPassword));
		System.out.println(data);
		if(data==0) str = "no";
		else str = "yes";
		return str;
	}
}
