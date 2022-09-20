package com.service.gnt.controller;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.service.gnt.domain.event.Game;
import com.service.gnt.domain.event.Quiz;
import com.service.gnt.model.service.CardService;
import com.service.gnt.model.service.EventService;
@Component
@RestController
public class EventController implements CommandLineRunner{
	@Autowired ServletContext servletContext;
	@Autowired
	private EventService eventService;
	@Autowired
	private CardService CardService;
	@GetMapping("checkQuizPlayed.do")
	public Map<String, String> checkQuizPlayed (int userId) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		String check = eventService.checkQuizPlayed(userId);
		if (check.equals("1")) {
			result.put("message", "no"); // 이미 풀었어
		}
		else {
			result.put("message", "yes"); // 안 풀었어
		}
		return result;
	}
	@GetMapping("getQuiz.do")
	public Map<String, Object> getQuiz (int userId) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Quiz quiz;
									
		try {
			quiz = eventService.getQuiz(userId);
			result.put("notices", quiz);
			result.put("message", "yes"); // 이거 왜 넣는거지
		}
		catch (Exception e) {
			result.put("message", "no");
		}
		return result;
	}
	@GetMapping("submitAnswer.do")
	public Map<String, Object> submitAnswer (int userId, String userAnswer) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		int answer = eventService.getQuizAnswer(userId);
		if (answer == Integer.parseInt(userAnswer)) {
			int cash = (int)(Math.random() * (500-10))+10; // 10원 ~ 500원으로 하자 매일이자나 
			eventService.expressQuizWin(userId, cash);
			result.put("mileage", cash);
			result.put("message", "yes");
		}
		else {
			result.put("message", "no");
		}
		return result;
	}
	@GetMapping("checkRoulettePlayed.do")
	public Map<String, String> checkRoulettePlayed (int userId) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		String check = eventService.checkRoulettePlayed(userId);
		if (check.equals("1")) {
			result.put("message", "no"); // 이미 돌렸어
		}
		else {
			result.put("message", "yes"); // 안 돌렸어
		}
		return result;
	}
	@GetMapping("getRouletteWinner.do")
	public Map<String, String> getRouletteWinner (int userId) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
												
		int winner = (int)servletContext.getAttribute("winner");
		System.out.println("EventController :: "+winner);
		eventService.expressRoulette(userId);
		if (userId == winner) {
			result.put("message", "yes");
		}
		else {
			result.put("message", "no");
		}
		return result;
	}
	
	
	
	// 2022.09.05 추가
	
	
	
	@PostMapping("checkGamePlayed.do")
	public Map<String, Object> checkGamePlayed (int userId) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		String check = eventService.checkGamePlayed(userId);
		
		System.out.println(check);
		Game game;
		if (check == null) {
			game = new Game();
			game.setUserId(userId);
			game.setGameLocation(0);
			game.setRoundTrip(0);
			game.setIsToday('0');
			game.setIsTomorrow('0');
			game.setTop(122);
			game.setLeft(276);
			eventService.insertGame(game);
			result.put("game", game);
			result.put("message", "yes");
		}
		else if (check.equals("1")) { // 이미 돌렸어
			result.put("message", "no"); 
		}
		else { // 안 돌렸어
			game = eventService.getGame(userId);
			if (game.getRoundTrip()>10) { // 안 돌렸지만 10회나 돌았어.. 
				result.put("message","end");
			}
			else {
				result.put("game", game);
				result.put("message", "yes"); 
			}
		}
		return result;
	}
	
	@PostMapping("submitGame.do")
	public Map<String, Object> submitGame (@RequestParam int userId, Game game) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Game beforeGame = eventService.getGame(userId);
		Game afterGame = game;
		
		int roundNum = afterGame.getRoundTrip();
		int locationNum = afterGame.getGameLocation();
		int[] bonus = {0,0,100,0,10,0,200,
				       0,0,100,0,
				       0,10,0,100,0,20,0,
				       0,0,200,0};
		
		afterGame.setGameId(0); // 오류 방지용 
		afterGame.setUserId(userId);
		afterGame.setIsToday('1');
		afterGame.setIsTomorrow('0');
		
		try {
			
			// --------------------------------------------------------------------------- 한 바퀴 단위
			
			if(beforeGame.getRoundTrip() != roundNum) { // 한 바퀴 돌았어!
				if (roundNum == 5) {
					CardService.modifyIsUniqueFont(userId);
				}
				else if (roundNum == 10) {
					CardService.modifyIsUniqueColor(userId);
				}
				else {
					eventService.updateGameForMilieage(userId, roundNum*200); // 횟수 x 2배
				}
			}
			
			// --------------------------------------------------------------------------- 한 칸 단위
			
			result.put("message", "bang");
			
			if (locationNum == 7) { // 한 번 더
				result.put("message", "again");
				afterGame.setIsToday('0');
			}
			else if (locationNum == 11) { // 처음으로
				afterGame.setGameLocation(0);
				afterGame.setTop(122);
				afterGame.setLeft(276);
				result.put("message", "yes");
			}
			else if (locationNum == 18) { // 내일 휴가
				afterGame.setIsTomorrow('1');
				result.put("message", "yes");
			}
			else if (roundNum <= 5) { // 전체 횟수를 1,2,3,4,5
				if (locationNum == 2 ||locationNum == 6 ||locationNum == 9 ||locationNum == 14 ||locationNum == 20) {
					result.put("message", "yes");
					eventService.updateGameForMilieage(userId, bonus[locationNum]);
				} else if (locationNum == 4 || locationNum == 12 || locationNum == 16) {
					result.put("message", "yes");
					eventService.updateGameForMoney(userId, bonus[locationNum]);
				}
			}
			else{ // 6,7,8,9,10
				if (locationNum == 2 ||locationNum == 6 ||locationNum == 9 ||locationNum == 14 ||locationNum == 20) {
					result.put("message", "yes");
					eventService.updateGameForMilieage(userId, bonus[locationNum]*2);
				} else if (locationNum == 4 || locationNum == 12 || locationNum == 16) {
					result.put("message", "yes");
					eventService.updateGameForMoney(userId, bonus[locationNum]*2);
				}
			}
			
			eventService.updateGame(afterGame); // 저장
			
		} catch (Exception e) {
			result.put("message", "no");
		}
		
		
		
		return result;
	}
	
	
	
	// 0시 0분 리셋
	@Scheduled(cron = "0 0 0 * * *")
	public void doSchedule() throws Exception {
		// 퀴즈, 돌림판, 게임 리셋
		eventService.resetEvent();
		// 게임 중 내일 하면 안 되는 사람 막아
		eventService.resetEventCheckTomorrow();
		// 돌림판 추첨 -- user가 삭제될 수도 있으니, null이 아닐 때까지 계속 반복(삭제는 안 하는 걸로.)
		List<Integer> user = eventService.resetRoulette();
		int winner = 0;
		Collections.shuffle(user);
		winner = user.get(0);
		servletContext.setAttribute("winner", winner); // error ----------------- 매일 값 바꿀 수 있는 건가?
		//int result = (int)servletContext.getAttribute("winner");
		//System.out.println("scheduler :: "+result);
	}
	// 서버가 구동될 때 실행
	@Override
	public void run(String... args) throws Exception {
		
		eventService.resetEvent();
		//eventService.resetEventCheckTomorrow();
		List<Integer> user = eventService.resetRoulette();
		int winner = 0;
		Collections.shuffle(user);
		if (user.size()!=0) {
			winner = user.get(0);			
		}
		servletContext.setAttribute("winner", winner);
		
	}
}

