package com.service.gnt.model.service;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.donation.Donation;
import com.service.gnt.model.dao.DonationDAO;
@Service
public class DonationServiceImpl implements DonationService{
	@Autowired
	private DonationDAO donationDAO;
	public int modifyDonationAmount(Donation donation) {
		return donationDAO.modifyDonationAmount(donation);
	}
	public int modifyMileage(Account account) {
		return donationDAO.modifyMileage(account);
	}
	public Account getAccountByUserId(int userId) {
		return donationDAO.getAccountByUserId(userId);
	}
	public String getAccIdByUserId(int userId) {
		return donationDAO.getAccIdByUserId(userId);
	}
	public Account getAccount(String accId) {
		return donationDAO.getAccount(accId);
	}
	public Account modifyMileage(int userId, int donationAmount) {
		return donationDAO.modifyMileage(userId, donationAmount);
	}
	public int addMileageThruDonation(int donationAmount, int userId) {
		return donationDAO.addMileageThruDonation(donationAmount, userId);
	}
	public int addDonationHistory(String donationId, int donationAmount, int userId) {
		return donationDAO.addDonationHistory(donationId,donationAmount,userId);
	}
	public List<Donation> getDonationAsk() {
		return donationDAO.getDonationAsk();
	}
	public List<Donation> getCategoryPage(int categoryId) {
		return donationDAO.getCategoryPage(categoryId);
	}
	public List<Donation> getDonationPage(int k) {
		return donationDAO.getDonationPage(k);
	}
	public Donation getDoantionDetail(String donationId) {
		return donationDAO.getDoantionDetail(donationId);
	}
	public List<HashMap<String,Object>> getDonationStatistic(Integer userId) {
		return donationDAO.getDonationStatistic(userId);
	}

	public HashMap<String, Object> getDonationStatistic2(Integer userId){
		return donationDAO.getDonationStatistic2(userId);
	}
}
