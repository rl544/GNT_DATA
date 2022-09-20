package com.service.gnt;

import java.io.Reader;
import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.card.Card;

@RunWith(SpringRunner.class)
@SpringBootTest
class CardMyBatisTest {
	
	// card test (myBatis) ----------------------------------------------------------------------
	@Test
	void insertCardTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		Card card = new Card(); // card 생성자 입력
		
		int result = session.insert("ns.sql.CardMapper.insertCard",card);
		
		System.out.println("Card Test :: insertCard? ----------> "+result);
		session.commit();
	}
	
	@Test
	void selectCardAccIdTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String userId = "57"; // userId 입력
		
		String accId = session.selectOne("ns.sql.CardMapper.selectCardAccId", userId);
		
		System.out.println("Card Test :: selectCardAccId? ----------> "+accId);
		session.commit();
	}
	
	@Test
	void updateCardToAccTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		Account account = new Account("4223616120041","1234567890123456",""); // account 집어넣기
		int result = session.update("ns.sql.CardMapper.updateCardIdOnAccount", account);
		
		System.out.println("Card Test :: updateCardToAcc? ----------> "+result);
		session.commit();
	}
	
	@Test
	void deleteCardTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String cardId = "1234567890123456"; // 카드번호 입력
		int result = session.delete("ns.sql.CardMapper.deleteCard", cardId);
		
		System.out.println("Card Test :: deleteCard? ----------> "+result);
		session.commit();
	}
	
	@Test
	void selectAccIdsTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		List<String> list = session.selectList("ns.sql.CardMapper.selectAccIds","57");
		
		for (String accId: list) {
			System.out.println("Card Test :: selectAccIds? ----------> "+accId+" (List)");
		}
		session.commit();
	}
	
	
	@Test
	void selectCardIdTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String accId = "4223616120041"; // 계좌번호 입력
		String result = session.selectOne("ns.sql.CardMapper.selectCardId", accId);
		
		System.out.println("Card Test :: selectCardId? ----------> "+result);
		session.commit();
	}
	
	@Test
	void updateCardIssuedTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String cardId = "1111111111111111"; // 카드번호
		int result = session.update("ns.sql.CardMapper.updateCardIsIssued", cardId);
		
		System.out.println("Card Test :: updateCardIssued? ----------> "+result);
		session.commit();
	}
	
	@Test
	void selectCardDeleteTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String accId = "4223616120041"; // 계좌번호 입력
		String cardId = session.selectOne("ns.sql.CardMapper.selectCardDelete", accId);
		
		System.out.println("Card Test :: selectCardDelete? ----------> "+cardId);
		session.commit();
	}
	
	@Test
	void selectIsIssuedTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String cardId = "1111111111111111"; // 카드번호
		String isIssued = session.selectOne("ns.sql.CardMapper.selectIsIssued", cardId);
		
		System.out.println("Card Test :: selectIsIssued? ----------> "+isIssued);
		session.commit();
	}
	
	@Test
	void selectEndtimeTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String cardId = "1111111111111111"; // 카드번호
		String endTime = session.selectOne("ns.sql.CardMapper.selectEndtime", cardId);
		
		System.out.println("Card Test :: selectEndtime? ----------> "+endTime);
		
		LocalDate now = LocalDate.now();
		
		System.out.println("check :: "+now);
		session.commit();
	}
	
	@Test
	void selectCardTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String cardId = "1111111111111111"; // 카드번호
		Card card = session.selectOne("ns.sql.CardMapper.selectCard", cardId);
		
		System.out.println("Card Test :: selectCard? ----------> "+card);
		
		session.commit();
	}
	
	@Test
	void updateCardTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		Card card = new Card();
		card.setCardId("1111111111111111");
		card.setCvc(111);
		card.setBgFront("000000");
		card.setBgBack("111111");
		card.setEmoId(5);
		card.setEmoInfoTop(15);
		card.setEmoInfoLeft(15);
		card.setCardContent("변경후시다");
		card.setIsIssued("0");
		int result = session.update("ns.sql.CardMapper.updateCard", card);
		
		System.out.println("Card Test :: updateCard? ----------> "+result);
		
		session.commit();
	}
	
	@Test
	void updateIsUniqueColorTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String cardId = "1111111111111111"; // 카드번호
		int result = session.update("ns.sql.CardMapper.updateIsUniqueColor", cardId);
		
		System.out.println("Card Test :: updateIsUniqueColor? ----------> "+result);
		session.commit();
	}
	
	@Test
	void updateIsUniqueFontTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String cardId = "1111111111111111"; // 카드번호
		int result = session.update("ns.sql.CardMapper.updateIsUniqueFont", cardId);
		
		System.out.println("Card Test :: updateIsUniqueFont? ----------> "+result);
		session.commit();
	}

}
