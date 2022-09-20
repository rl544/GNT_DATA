package com.service.gnt.model.service;
import java.util.List;
import com.service.gnt.domain.notice.Notice;
public interface NoticeService {
	List<Notice> getNoticeList();
	Notice getNoticeDetail(int noticeId);
	int getNoticeCount();
	int addNoticeCount(int noticeId);
}
