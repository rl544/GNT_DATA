package com.service.gnt.domain.donation;
import com.service.gnt.domain.users.Users;
public class DonationHistory {
	private int donationHistoryId;
	private Donation donation;
	private Users users;
	private String createTime; // date
	private int amount;
	private String donationId;
	private int donationAmount;
	private int userId;
	public DonationHistory(String donationId, int donationAmount, int userId) {
		super();
		this.donationId = donationId;
		this.donationAmount = donationAmount;
		this.userId = userId;
		
	}
	public DonationHistory(int donationHistoryId, Donation donation, Users users, String createTime, int amount) {
		super();
		this.donationHistoryId = donationHistoryId;
		this.donation = donation;
		this.users = users;
		this.createTime = createTime;
		this.amount = amount;
	}
	public int getDonationHistoryId() {
		return donationHistoryId;
	}
	public void setDonationHistoryId(int donationHistoryId) {
		this.donationHistoryId = donationHistoryId;
	}
	public Donation getDonation() {
		return donation;
	}
	public void setDonation(Donation donation) {
		this.donation = donation;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String toString() {
		return "DonationHistory [donationHistoryId=" + donationHistoryId + ", donation=" + donation + ", users=" + users
				+ ", createTime=" + createTime + ", amount=" + amount + "]";
	}
	
}
