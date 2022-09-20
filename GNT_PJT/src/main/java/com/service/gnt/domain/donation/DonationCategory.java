package com.service.gnt.domain.donation;
public class DonationCategory {
	private int categoryId;
	private String categoryTitle;
	public DonationCategory() {}
	public DonationCategory(int categoryId, String categoryTitle) {
		super();
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryTitle() {
		return categoryTitle;
	}
	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	public String toString() {
		return "donationCategory [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + "]";
	}
	
}
