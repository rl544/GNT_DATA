package com.service.gnt.model.dao;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.service.gnt.domain.notice.Notice;
@Repository
public class NoticeDAOImpl implements NoticeDAO{
	private static final String NM = "ns.sql.NoticeMapper.";
	@Autowired
	private SqlSession sqlSession;
	public List<Notice> getNoticeList(){
		return sqlSession.selectList(NM+"selectNoticeList");
	}
	public int getNoticeCount() {
		return sqlSession.selectOne(NM+"selectNoticeAmount");
	}
	public Notice getNoticeDetail(int noticeId) {
		return sqlSession.selectOne(NM+"selectNoticeDetail", noticeId);
	}
	public int addNoticeCount(int noticeId) {
		return sqlSession.update(NM+"updateNoticeCount", noticeId);
	}
}
