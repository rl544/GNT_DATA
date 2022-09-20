package com.service.gnt.domain.notice;
import com.service.gnt.domain.users.Users;
public class Notice {
	private int noticeId;
	//private Users users;
	private String userId;
	private String noticeTitle;
	private String noticeContent;
	private String createTime; // date
	private int viewCnt;
	public Notice() {}
	/*
	public Notice(int noticeId, Users users, String noticeTitle, String noticeContent, String createTime, int viewCnt) {
		super();
		this.noticeId = noticeId;
		this.users = users;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createTime = createTime;
		this.viewCnt = viewCnt;
	}*/
	public Notice(int noticeId, String userId, String noticeTitle, String noticeContent, String createTime,
			int viewCnt) {
		super();
		this.noticeId = noticeId;
		this.userId = userId;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createTime = createTime;
		this.viewCnt = viewCnt;
	}
	public int getNoticeId() {
		return noticeId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeContent="
				+ noticeContent + ", createTime=" + createTime + ", viewCnt=" + viewCnt + "]";
	}
	
}
