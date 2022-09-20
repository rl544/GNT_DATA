package com.service.gnt.model.dao;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.card.Card;
@Repository
public class CardDAOImpl implements CardDAO{
	
	
	@Autowired
	private SqlSession sqlSession;
	public final static String NS = "ns.sql.CardMapper.";
	
	
	public int createCard(Card card) throws Exception {
		return sqlSession.insert(NS+"insertCard",card);
	}
	public String selectCardAccId(int userId) throws Exception {
		return sqlSession.selectOne(NS+"selectCardAccId", userId);
	}
	public int updateCardToAcc(Account account) throws Exception {
		return sqlSession.update(NS+"updateCardIdOnAccount", account);
	}
	public int removeCard(String cardId) throws Exception {
		return sqlSession.delete(NS+"deleteCard", cardId);
	}
	public List<String> selectAccIds() throws Exception {
		List<String> list = sqlSession.selectList(NS+"selectAccIds");
		return list;
	}
	public String selectCardId(String accId) throws Exception {
		return sqlSession.selectOne(NS+"selectCardId", accId);
	}
	public int modifyCardIssue(String cardId) throws Exception {
		return sqlSession.update(NS+"updateCardIsIssued", cardId);
	}
	public String selectCardDelete(String accId) throws Exception {
		return sqlSession.selectOne(NS+"selectCardDelete", accId);
	}
	public String getCardIsIssue(String cardId) throws Exception {
		return sqlSession.selectOne(NS+"selectIsIssued", cardId);
	}
	public String getEndTime(String cardId) throws Exception {
		return sqlSession.selectOne(NS+"selectEndtime", cardId);
	}
	public Card getCard(String cardId) throws Exception {
		Card card = sqlSession.selectOne(NS+"selectCard", cardId);
		return card;
	}
	public int modifyCard(Card card) throws Exception {
		return sqlSession.update(NS+"updateCard", card);
	}
	
	
	
	// 2022.09.05 추가
	
	
	
	public int modifyIsUniqueColor(String cardId) throws Exception {
		return sqlSession.update(NS+"updateIsUniqueColor", cardId);
	}
	@Override
	public int modifyIsUniqueFont(String cardId) throws Exception {
		return sqlSession.update(NS+"updateIsUniqueFont", cardId);
	}
}
