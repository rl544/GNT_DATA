package com.service.gnt.model.dao;
import java.util.List;
import com.service.gnt.domain.notice.Notice;
public interface NoticeDAO {
	List<Notice> getNoticeList();
	Notice getNoticeDetail(int noticeId);
	int getNoticeCount();
	int addNoticeCount(int noticeId);
}
