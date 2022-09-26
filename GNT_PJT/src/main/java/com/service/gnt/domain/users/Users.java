package com.service.gnt.domain.users;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.event.Quiz;
public class Users {
	private int userId;
	private String accId;
	private String userName;
	private String userNameEng;
	private String userEmail;
	private String userPassword;
	private String address;
	private String phone;
	private int totalDonation;
	private int quizId;
	private String isQuizParticipate; // BOOLEAN
	private String isStaff;
	public Users() {}
	public Users(String userEmail, String userName, String userPassword) {
		this.userEmail = userEmail;
		this.userName = userName;
		this.userPassword = userPassword;
	}
	public Users(int userId, String accId, String userNameEng, String address, String phone) {
		super();
		this.userId = userId;
		this.accId = accId;
		this.userNameEng = userNameEng;
		this.address = address;
		this.phone = phone;
	}
	public Users(int userId, String accId, String userName, String userNameEng, String userEmail, String userPassword,
			String address, String phone) {
		super();
		this.userId = userId;
		this.accId = accId;
		this.userName = userName;
		this.userNameEng = userNameEng;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.address = address;
		this.phone = phone;
	}
	public Users(int userId, String accId, String userName, String userEmail, String userPassword, String address,
			int totalDonation, int quizId, String isQuizParticipate) {
		super();
		this.userId = userId;
		this.accId = accId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.address = address;
		this.totalDonation = totalDonation;
		this.quizId = quizId;
		this.isQuizParticipate = isQuizParticipate;
	}
	public Users(int userId, String accId, String userName, String userNameEng, String userEmail, String userPassword,
			String address, String phone, int totalDonation, int quizId, String isQuizParticipate, String isStaff) {
		super();
		this.userId = userId;
		this.accId = accId;
		this.userName = userName;
		this.userNameEng = userNameEng;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.address = address;
		this.phone = phone;
		this.totalDonation = totalDonation;
		this.quizId = quizId;
		this.isQuizParticipate = isQuizParticipate;
		this.isStaff = isStaff;
	}
	public String getIsStaff() {
		return isStaff;
	}
	public void setIsStaff(String isStaff) {
		this.isStaff = isStaff;
	}
	public String getAccId() {
		return accId;
	}
	public void setAccId(String accId) {
		this.accId = accId;
	}
	public String getUserphone() {
		return phone;
	}
	public void setUserphone(String phone) {
		this.phone = phone;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getTotalDonation() {
		return totalDonation;
	}
	public void setTotalDonation(int totalDonation) {
		this.totalDonation = totalDonation;
	}
	public int getQuiz() {
		return quizId;
	}
	public void setQuiz(int quizId) {
		this.quizId = quizId;
	}
	public String getIsQuizParticipate() {
		return isQuizParticipate;
	}
	public void setIsQuizParticipate(String isQuizParticipate) {
		this.isQuizParticipate = isQuizParticipate;
	}
	public String getUserEngName() {
		return userNameEng;
	}
	public void setUserEngName(String userNameEng) {
		this.userNameEng = userNameEng;
	}
	public String toString() {
		return "Users [userId=" + userId + ", accId=" + accId + ", userName=" + userName + ", userNameEng="
				+ userNameEng + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", address=" + address
				+ ", phone=" + phone + ", totalDonation=" + totalDonation + ", quizId=" + quizId + ", isQuizParticipate="
				+ isQuizParticipate + "]";
	}
}
