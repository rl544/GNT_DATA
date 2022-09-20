package com.service.gnt.model.dao;
import java.util.List;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.card.Card;
public interface CardDAO {
	int createCard(Card card) throws Exception;
	String selectCardAccId(int userId) throws Exception;
	int updateCardToAcc(Account account) throws Exception;
	int removeCard(String cardId) throws Exception;
	List<String> selectAccIds() throws Exception;
	String selectCardId(String accId) throws Exception;
	int modifyCardIssue(String cardId) throws Exception;
	String selectCardDelete(String accId) throws Exception;
	String getCardIsIssue(String cardId) throws Exception;
	String getEndTime(String cardId) throws Exception;
	Card getCard(String cardId) throws Exception;
	int modifyCard(Card card) throws Exception;
	
	int modifyIsUniqueColor(String cardId) throws Exception;
	int modifyIsUniqueFont(String cardId) throws Exception;
}
