package com.service.gnt.model.service;
import java.util.List;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.card.Card;
public interface CardService {
	void createCard(Card card, int userId) throws Exception;
	void removeCard(int userId) throws Exception;
	boolean checkCardIdExistancy(String cardId) throws Exception;
	boolean checkCardReIssue(int userId) throws Exception;
	// new
	boolean getCardIsIssue(int userId) throws Exception;
	String getEndTime(int userId) throws Exception;
	Card getCard(int userId) throws Exception;
	void modifyCard(int userId, Card card) throws Exception;
	void modifyCardIssue(int userId) throws Exception;
	
	void modifyIsUniqueColor(int userId) throws Exception;
	void modifyIsUniqueFont(int userId) throws Exception;
	
}
