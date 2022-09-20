package com.service.gnt;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.domain.card.Card;
import com.service.gnt.domain.event.Quiz;

@RunWith(SpringRunner.class)
@SpringBootTest
class EventMyBatisOldTest {
	
	
	// Event test (myBatis) ----------------------------------------------------------------------
	
	@Test
	void selectQuizCKTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String userId = "57"; // userId 입력
		String check = session.selectOne("ns.sql.EventMapper.selectQuizCK", userId);
		
		System.out.println("Event Test :: selectQuizCK? ----------> "+check);
		
	}
	
	@Test
	void selectQuizIdTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String userId = "57"; // userId 입력
		String quizId = session.selectOne("ns.sql.EventMapper.selectQuizId", userId);
		
		System.out.println("Event Test :: selectQuizId? ----------> "+quizId);
		
	}
	
	@Test
	void selectQuizTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String quizId = "1"; // quizId 입력
		Quiz quiz = session.selectOne("ns.sql.EventMapper.selectQuiz", quizId);
		
		System.out.println("Event Test :: selectQuiz? ----------> "+quiz);
		
	}
	
	@Test
	void selectQuizAnswerTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String quizId = "1"; // quizId 입력
		int answer = session.selectOne("ns.sql.EventMapper.selectQuizAnswer", quizId);
		
		System.out.println("Event Test :: selectQuizAnswer? ----------> "+answer);
		
	}
	
	@Test
	void updateQuizUserTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String userId = "57"; // userId 입력
		int result = session.update("ns.sql.EventMapper.updateQuizUser", userId);
		
		System.out.println("Event Test :: updateQuizUser? ----------> "+result);
		
	}
	
	@Test
	void selectQuizAccIdTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String userId = "57"; // userId 입력
		String accId = session.selectOne("ns.sql.EventMapper.selectQuizAccId", userId);
		
		System.out.println("Event Test :: selectQuizAccId? ----------> "+accId);
		
	}
	
	
	@Test
	void updateQuizMileageTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		Account account = new Account(); // account 입력
		account.setAccId("1");
		account.setMileage(100);
		int result = session.update("ns.sql.EventMapper.updateQuizMileage", account);
		
		System.out.println("Event Test :: updateQuizMileage? ----------> "+result);
		
	}
	
	@Test
	void selectMilieageHistorySeqTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int seq = session.selectOne("ns.sql.EventMapper.selectMilieageHistorySeq");
		
		System.out.println("Event Test :: selectMilieageHistorySeq? ----------> "+seq);
		
	}
	
	@Test
	void insertMilieageTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		MileageHistory mileageHistory = new MileageHistory(); // MileageHistory 생성
		mileageHistory.setMileagePk(101);
		mileageHistory.setAccId("1");
		mileageHistory.setMileageAmount(100);
		mileageHistory.setMileageContent("적립");
		
		int result = session.insert("ns.sql.EventMapper.insertMilieage", mileageHistory);
		
		System.out.println("Event Test :: insertMilieage? ----------> "+result);
		
	}
	
	
	
	
	@Test
	void updateQuizResetTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int result = session.update("ns.sql.EventMapper.updateQuizReset");
		
		System.out.println("Event Test :: updateQuizReset? ----------> "+result);
		
	}
	
	@Test
	void selectAllUserIdTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		List<Integer> list = session.selectList("ns.sql.EventMapper.selectAllUserId");
		
		
		for (int userId: list) {
			System.out.println("Event Test :: selectAllUserId? ----------> "+userId+" (List)");
		}
	}
	
	
	
	
	@Test
	void updateRouletteUserTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int result = session.update("ns.sql.EventMapper.updateRouletteUser");
		
		System.out.println("Event Test :: updateRouletteUser? ----------> "+result);
		
	}
	
}
