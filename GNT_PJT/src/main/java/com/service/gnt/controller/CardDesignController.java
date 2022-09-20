package com.service.gnt.controller;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.service.gnt.domain.card.Card;
import com.service.gnt.domain.users.Users;
import com.service.gnt.model.service.CardService;
@RestController
public class CardDesignController {
	@Autowired
	private CardService cardService;
	
	
	
	// 조회 (시작할 때)
	@GetMapping("getCard.do")
	public Map<String, Object> getCard(int userId) throws Exception{
		// 1. 발급 받았는데 날짜도 아직이야 -- no
		// 2. 발급 받았는데 날짜 지났어 -- 새롭게 줘
		// 3. 발급 안 받았는데 데이터는 있어 -- 받아 와
		// 4. 발급 안 받았는데 데이터도 없어 -- 새롭게 줘
		Map<String, Object> result = new HashMap<String, Object>();
		LocalDate time = LocalDate.now();
		String stringTime = time.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		stringTime = stringTime.replaceAll("-", ""); //20220902
		// 이미 발급 받았는지 확인
		if (cardService.getCardIsIssue(userId)) { // true면은 발급 이미 받았다
			String endTime = cardService.getEndTime(userId);
			endTime = endTime.substring(0, 10);
			endTime = endTime.replaceAll("-", ""); // 20220902
			if (Integer.parseInt(stringTime)<Integer.parseInt(endTime)) { // 아직 끝나지 않은 시간..
				result.put("message", "no");
			}
			else { // 카드 새로 받자!
				cardService.removeCard(userId);
				result.put("card", null);
				result.put("message", "yes");
			}
		}
		else { // false면은 발급 안 받았다
			if (cardService.checkCardReIssue(userId)) { // 값이 있대.
				Card card = cardService.getCard(userId);
				result.put("card", card);
				result.put("message", "yes");
			}
			else {
				result.put("card", null);
				result.put("message", "yes");
			}
		}
		return result;
	}
	
	
	
	
	
	// 저장 버튼
	@PostMapping("saveCard.do")
	public Map<String, String> saveCard(@RequestParam int userId, Card card) throws Exception{
		System.out.println("==============================================");
		System.out.println(userId);
		System.out.println(card.toString());
		Map<String, String> result = new HashMap<String, String>();
		if (cardService.getCard(userId)==null) { // 처음 저장? -- insert
			// 카드 번호 랜덤 생성 (4번 만들어서 4번 붙이자!)
			// 카드 랜덤 확인 (false 뜰 때까지 반복)
			String tempCard = "";
			while (tempCard=="" || cardService.checkCardIdExistancy(tempCard)) {  // -------------------------------------------------------------- error check
				tempCard = "";
				for (int i=0;i<4;i++) {
					int ranNum = (int)(Math.random() * (9999-1000))+1000;
					tempCard += Integer.toString(ranNum);
				}
				System.out.println("cardDesignController :: temp card id? -> "+tempCard);
			}
			// cvc 랜덤 생성 (중복 체크 안 해도 됨)
			int tempCvc = (int)(Math.random() * (999-100))+100;
			System.out.println("cardDesignController :: temp cvc id? -> "+tempCvc);
			// 카드 객체 생성해서 담기
			card.setCardId(tempCard);
			card.setCvc(tempCvc);
			try {
				// 카드 생성
				cardService.createCard(card, userId);
				result.put("message", "yes");
			} catch (Exception e) {
				result.put("message", "no");
				System.out.println(e.getMessage());
			}
		}
		else { // 처음 아닌 저장? -- update
			try {
				cardService.modifyCard(userId, card);
				result.put("message", "yes");
			}
			catch (Exception e) {
				result.put("message", "no");
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	
	
	
	
	// 발급 버튼
	@PutMapping("issueCard.do")
	public Map<String, String> issueCard(@RequestParam int userId) throws Exception{
		Map<String, String> result = new HashMap<String, String>();
		// 발급 가능? -- updateCardIssued
		try {
			cardService.modifyCardIssue(userId);
			result.put("message", "yes");
		}
		catch (Exception e) {
			result.put("message", "no");
			System.out.println(e.getMessage());
		}
		return result;
	}
	
}
