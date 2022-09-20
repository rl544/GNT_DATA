package com.service.gnt.model.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.service.gnt.domain.notice.Notice;
import com.service.gnt.model.dao.NoticeDAO;
@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDAO noticeDAO;
	public List<Notice> getNoticeList(){
		return noticeDAO.getNoticeList();
	}
	public Notice getNoticeDetail(int noticeId) {
		return noticeDAO.getNoticeDetail(noticeId);
	}
	public int getNoticeCount() {
		return noticeDAO.getNoticeCount();
	}
	public int addNoticeCount(int noticeId) {
		return noticeDAO.addNoticeCount(noticeId);
	}
}
