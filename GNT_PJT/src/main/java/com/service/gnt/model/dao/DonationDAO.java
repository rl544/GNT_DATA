package com.service.gnt.model.dao;
import java.util.List;
import java.util.Map;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.donation.Donation;
public interface DonationDAO {
	List<Donation> getDonationAsk();
	List<Donation> getCategoryPage(int categoryId);
	List<Donation> getDonationPage(int k);
	Donation getDoantionDetail(String donationId);
	int modifyDonationAmount(Donation donation);
	int modifyMileage(Account account);
	Account getAccountByUserId(int userId);
	String getAccIdByUserId(int userId);
	Account getAccount(String accId);
	Account modifyMileage(int userId, int donationAmount);
	int addMileageThruDonation(int donationAmount, int userId);
	int addDonationHistory(String donationId, int donationAmount, int userId);
	
}
