package com.service.gnt.domain.card;
public class Emo {
	private int emoId;
	private String emoUri;
	public Emo() {}
	public Emo(int emoId, String emoUri) {
		super();
		this.emoId = emoId;
		this.emoUri = emoUri;
	}
	public int getEmoId() {
		return emoId;
	}
	public void setEmoId(int emoId) {
		this.emoId = emoId;
	}
	public String getEmoUri() {
		return emoUri;
	}
	public void setEmoUri(String emoUri) {
		this.emoUri = emoUri;
	}
	public String toString() {
		return "Emo [emoId=" + emoId + ", emoUri=" + emoUri + "]";
	}
	
}
