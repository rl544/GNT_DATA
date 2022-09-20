package com.service.gnt.model.service;
import java.util.List;

import com.service.gnt.domain.event.Game;
import com.service.gnt.domain.event.Quiz;
public interface EventService {
	
	// 퀴즈 풀이 여부
	String checkQuizPlayed(int userId) throws Exception;
	// 퀴즈 데이터 가져오기
	Quiz getQuiz(int userId) throws Exception;
	// 퀴즈 정답 반환 및 고객 퀴즈 데이터 변경
	int getQuizAnswer(int userId) throws Exception;
	// 고객이 정답을 맞췄을 시
	void expressQuizWin(int userId, int random) throws Exception;
	
	// 돌림판 실행 여부
	String checkRoulettePlayed(int userId) throws Exception;
	// 돌림판 실행
	void expressRoulette(int userId) throws Exception;
	// 퀴즈와 룰렛 세팅
	void resetEvent() throws Exception; // change
	List<Integer> resetRoulette() throws Exception;
	
	// 게임
	String checkGamePlayed(int userId) throws Exception;
	void insertGame(Game game) throws Exception;
	Game getGame(int userId) throws Exception;
	void updateGame(Game game) throws Exception;
	void updateGameForMilieage(int userId, int mp) throws Exception;
	void updateGameForMoney(int userId, int money) throws Exception;
	void resetEventCheckTomorrow() throws Exception; // change
	
	
}
