package com.service.gnt.model.dao;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.domain.donation.Donation;
import com.service.gnt.domain.donation.DonationHistory;
@Repository
public class DonationDAOImpl implements DonationDAO{
	private final String NS = "ns.sql.DonationMapper.";
	public final String UM = "ns.sql.UserMapper.";
	public final String AM = "ns.sql.AccountMapper.";
	@Autowired
	private SqlSession sqlSession;
	public List<Donation> getDonationAsk() {
		return sqlSession.selectList(NS+"selectDonationAsk", null);
	}
	public List<Donation> getCategoryPage(int categoryId) {
		return sqlSession.selectList(NS+"selectCategoryPage",categoryId);
	}
	public List<Donation> getDonationPage(int k) {
		return sqlSession.selectList(NS+"selectDonationPage",k);
	}
	public Donation getDoantionDetail(String donationId) {
		return sqlSession.selectOne(NS+"selectDonationDetail",donationId);
	}
	public int modifyDonationAmount(Donation donation) {
		return sqlSession.update(NS+"updateDonationAmount",donation);
	}
	public int modifyMileage(Account account) {
		return sqlSession.update(NS+"updateMileage",account);
	}
	public Account getAccountByUserId(int userId) {
		return getAccount(getAccIdByUserId(userId));
	}
	public String getAccIdByUserId(int userId) {
		return sqlSession.selectOne(UM+"selectAccIdByUserId",userId);
	}
	public Account getAccount(String accId) {
		return sqlSession.selectOne(AM+"selectAccount",accId);
	}
	public Account modifyMileage(int userId, int donationAmount) {
		Account acc1 = getAccountByUserId(userId);
		acc1.setMileage(acc1.getMileage()-donationAmount);
		return acc1;
	}
	public int addMileageThruDonation(int donationAmount, int userId) {
		String accId1 = getAccIdByUserId(userId);
	return sqlSession.insert(AM+"insertMileageHistory", new MileageHistory(accId1,(-1)*donationAmount,"기부"));
	}
	public int addDonationHistory(String donationId, int donationAmount, int userId) {
		return sqlSession.insert(NS+"insertDonationHistory", new DonationHistory(donationId, donationAmount,userId));
	}
	
}
