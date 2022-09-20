package com.service.gnt;

import java.io.Reader;
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
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.domain.event.Game;
import com.service.gnt.domain.event.Quiz;

@RunWith(SpringRunner.class)
@SpringBootTest
class EventMyBatisTest {
	
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
	
	
	
	
	// 2022.09.05 update
	
	
	
	
	@Test
	void selectGameSeqTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int userId = 58;
		int gameSeq = session.selectOne("ns.sql.EventMapper.selectGameSeq");
		
		System.out.println("Event Test :: selectGameSeq? ----------> "+gameSeq);
		
	}
	@Test
	void insertGameTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int gameId = 0;
		int userId = 57;
		Game game = new Game();
		game.setGameId(gameId);
		game.setUserId(userId);
		int result = session.insert("ns.sql.EventMapper.insertGame", game);
		
		System.out.println("Event Test :: insertGame? ----------> "+result);
		
	}
	
	
	@Test
	void selectIsTodayTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int userId = 57;
		Game game = session.selectOne("ns.sql.EventMapper.selectIsToday", userId);
		
		System.out.println("Event Test :: selectIsToday? ----------> "+game);
		
	}
	
	@Test
	void selectIsTomorrowTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		List<Game> game = session.selectList("ns.sql.EventMapper.selectIsTomorrow");
		
		for (Game vo:game) {
			System.out.println("Event Test :: selectIsTomorrow? ----------> "+vo);
		}
		
		
		
	}
	
	@Test
	void selectGameTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int userId = 58;
		
		Game game = session.selectOne("ns.sql.EventMapper.selectGame", userId);
		
		System.out.println("Event Test :: selectGame? ----------> "+game);
		
	}
	
	@Test
	void updateGameTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		Game game = new Game();
		game.setGameId(0);
		game.setUserId(57);
		game.setIsToday('1');
		game.setIsTomorrow('0');
		game.setGameLocation(5);
		game.setRoundTrip(1);
		int result = session.update("ns.sql.EventMapper.updateGame", game);
		
		System.out.println("Event Test :: updateGame? ----------> "+result);
		
	}
	
	@Test
	void updateGameIsTodayResetTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int result = session.update("ns.sql.EventMapper.updateGameIsTodayReset");
		
		System.out.println("Event Test :: updateGameIsTodayReset? ----------> "+result);
		
	}
	
	@Test
	void updateGameIsTomorrowResetTest() throws Exception {
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int userId = 57;
		
		int result = session.update("ns.sql.EventMapper.updateGameIsTomorrowReset", userId);
		
		System.out.println("Event Test :: updateGameIsTomorrowReset? ----------> "+result);
		
	}

}
