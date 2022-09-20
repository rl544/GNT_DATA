package com.service.gnt.model.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.domain.event.Game;
import com.service.gnt.domain.event.Quiz;
import com.service.gnt.model.dao.AccountDAO;
import com.service.gnt.model.dao.EventDAO;
@Service
public class EventServiceImpl implements EventService{
	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private AccountDAO accountDAO;
	// 퀴즈 풀이 여부 확인하기 (0->안 풀었음,  1-> 풀었음)
	public String checkQuizPlayed(int userId) throws Exception {
		return eventDAO.checkQuizPlayed(userId);
	}
	// 퀴즈 조회
	public Quiz getQuiz(int userId) throws Exception {
		int quizId = eventDAO.selectQuizId(userId); // 고객 퀴즈번호
		Quiz quiz = eventDAO.getQuiz(quizId); // 퀴즈
		return quiz;
	}
	// 퀴즈 제출 이후
	public int getQuizAnswer(int userId) throws Exception {
		int quizId = eventDAO.selectQuizId(userId); // 고객 퀴즈번호
		int result = eventDAO.getQuizAnswer(quizId); // 퀴즈 정답
		eventDAO.updateQuizUser(userId); // 퀴즈 풀이 이후 고객 DB 값 변경
		return result; // 퀴즈 정답
	}
	// 정답을 맞췄을 시
	public void expressQuizWin(int userId, int random) throws Exception {
		String accId = eventDAO.selectQuizAccId(userId); // 계좌 번호
		Account account = new Account(); // 계좌 VO에 계좌번호, 마일리지 금액 생성
		account.setAccId(accId);
		account.setMileage(random);
		eventDAO.updateQuizMileage(account); // 계좌 속 마일리지 변경
		int mhSeq = eventDAO.selectMilieageHistorySeq(); // 마일리지 내역 seq
		MileageHistory mh = new MileageHistory(); // 마일리지 내역 VO에 값 할당 
		mh.setMileagePk(mhSeq);
		mh.setAccId(accId);
		mh.setMileageAmount(random);
		mh.setMileageContent("적립");
		eventDAO.insertMilieage(mh); // 마일리지 내역 생성
	}
	// 돌림판 실행 여부
	public String checkRoulettePlayed(int userId) throws Exception {
		return eventDAO.checkRoulettePlayed(userId);
	}
	// 돌림판 실행
	public void expressRoulette(int userId) throws Exception {
		eventDAO.updateRouletteUser(userId);
	}
	// 퀴즈 리셋
	public void resetEvent() throws Exception {
		eventDAO.updateEventReset();
		eventDAO.updateGameIsTodayReset(); // 애플리케이션 구동할 때랑... 0시에 리셋돼도 괜찮은 건가?
	}
	// 돌림판 참가자 반환
	public List<Integer> resetRoulette() throws Exception {
		List<Integer> list = eventDAO.selectAllUserId();
		return list;
	}
	
	
	// 2020.09.05 추가
	
	// 게임 참가 여부 (오늘 - no.3 눌렀을 때)
	public String checkGamePlayed(int userId) throws Exception {
		return eventDAO.checkGamePlayed(userId);
	}
	// 게임 처음 시작할 때 (게임 테이블 생성 - 카드 안 만들면 못 함)
	public void insertGame(Game game) throws Exception {
		int gameId = eventDAO.selectGameSeq();
		game.setGameId(gameId);
		eventDAO.insertGame(game);
	}
	// 저장된 게임 데이터 호출
	public Game getGame(int userId) throws Exception {
		return eventDAO.getGame(userId);
	}
	// 게임 실행 후
	public void updateGame(Game game) throws Exception {
		eventDAO.updateGame(game);
	}
	
	public void updateGameForMilieage(int userId, int mp) throws Exception {
		String accId = eventDAO.selectQuizAccId(userId); // 계좌 번호
		Account account = new Account(); // 계좌 VO에 계좌번호, 마일리지 금액 생성
		account.setAccId(accId);
		account.setMileage(mp);
		eventDAO.updateQuizMileage(account); // 계좌 속 마일리지 변경
		int mhSeq = eventDAO.selectMilieageHistorySeq(); // 마일리지 내역 seq
		MileageHistory mh = new MileageHistory(); // 마일리지 내역 VO에 값 할당 
		mh.setMileagePk(mhSeq);
		mh.setAccId(accId);
		mh.setMileageAmount(mp);
		mh.setMileageContent("게임");
		eventDAO.insertMilieage(mh); // 마일리지 내역 생성
	}
	// 0시 0분에, tomorrow가 0인 사람은 이걸 해야 해
	public void resetEventCheckTomorrow() throws Exception {
		List<Game> list = eventDAO.checkGamePlayedTomorrow();
		for (Game game : list) {
			if (game.getIsTomorrow()=='1') {
				eventDAO.updateGameIsTomorrowReset(game.getUserId());
			}
		}
	}
	@Override
	public void updateGameForMoney(int userId, int money) throws Exception {
		accountDAO.depositAccount(userId, money);
	}




	
}
