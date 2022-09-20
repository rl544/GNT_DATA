package com.service.gnt.domain.account;
public class MileageHistory {
	private int mileagePk;
	private String accId;
	private String createTime; // date
	private int mileageAmount;
	private String mileageContent;
	public MileageHistory() {}
	public MileageHistory(String accId, int mileageAmount, String mileageContent) {
		super();
		this.accId = accId;
		this.mileageAmount = mileageAmount;
		this.mileageContent = mileageContent;
	}
	public MileageHistory(int mileagePk, String accId, String createTime, int mileageAmount) {
		super();
		this.mileagePk = mileagePk;
		this.accId = accId;
		this.createTime = createTime;
		this.mileageAmount = mileageAmount;
	}
	public MileageHistory(int mileagePk, String accId, String createTime, int mileageAmount, String mileageContent) {
		super();
		this.mileagePk = mileagePk;
		this.accId = accId;
		this.createTime = createTime;
		this.mileageAmount = mileageAmount;
		this.mileageContent = mileageContent;
	}
	public String getMileageContent() {
		return mileageContent;
	}
	public void setMileageContent(String mileageContent) {
		this.mileageContent = mileageContent;
	}
	public String getAccId() {
		return accId;
	}
	public void setAccId(String accId) {
		this.accId = accId;
	}
	public int getMileagePk() {
		return mileagePk;
	}
	public void setMileagePk(int mileagePk) {
		this.mileagePk = mileagePk;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getMileageAmount() {
		return mileageAmount;
	}
	public void setMileageAmount(int mileageAmount) {
		this.mileageAmount = mileageAmount;
	}
	public String toString() {
		return "MileageHistory [mileagePk=" + mileagePk + ", accId=" + accId + ", createTime=" + createTime
				+ ", mileageAmount=" + mileageAmount + ", mileageContent=" + mileageContent + "]";
	}
	
}
