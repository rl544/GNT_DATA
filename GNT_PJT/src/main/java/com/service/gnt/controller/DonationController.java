package com.service.gnt.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.donation.Donation;
import com.service.gnt.domain.users.Users;
import com.service.gnt.model.service.DonationService;
@RestController
public class DonationController {
	@Autowired
	private DonationService donationService;
	@GetMapping("getDonationAsk.do") //기부 페이지 조회 최신 20개
	public Map<String,Map<String,Object>> getDonationAsk(Model model) {
		String message = "no";
		Map<String,Map<String,Object>> maps = new HashMap<String,Map<String,Object>>();
		Map<String,Object> maps1 = new HashMap<String,Object>();
		Map<String,Object> maps2 = new HashMap<String,Object>();
		try {
			List<Donation> list = donationService.getDonationAsk();
			for(int i = 0 ; i<list.size() ; i++) {
				
				maps1.put(Integer.toString(i+1),list.get(i));
			}
				maps.put("Donation",maps1);
				message = "yes";
				maps2.put("message",message);
				maps.put("message",maps2);
				
			return maps;
		}catch(Exception e) {
			maps2.put("message", message);
			maps.put("message",maps1);
			return maps;
		}
	}
	
	@GetMapping("getDonationPage.do") //페이지별 기부 내역 조회
	public Map<String,Map<String,Object>> getDonationPage(int pagenum , Model model) {
		String message = "no";
		Map<String,Map<String,Object>> maps = new HashMap<String,Map<String,Object>>();
		Map<String,Object> maps1 = new HashMap<String,Object>();
		Map<String,Object> maps2 = new HashMap<String,Object>();
		try {
			List<Donation> list = donationService.getDonationPage(pagenum);
			model.addAttribute("title", "기부 목록 조회");
			model.addAttribute("donations", list);
			message = "yes";
			maps2.put("message", message);
			maps.put("message",maps2);
			for(int i = 0 ; i<list.size() ; i++) {
				maps1.put(Integer.toString(i+1),list.get(i));
				
			}
			maps.put("Donation",maps1);
				
			return maps;
		} catch (Exception e) {
			maps1.put("message", message);
			maps.put("message",maps1);
			return maps;
		}
		
	}
	@GetMapping("getCategoryPage.do")//카테고리별 모든 기부 목록 조회
	public Map<String,Map<String,Object>> getCategoryPage(int categoryId, Model model) {
		String message = "no";
		Map<String,Map<String,Object>> maps = new HashMap<String,Map<String,Object>>();
		Map<String,Object> maps1 = new HashMap<String,Object>();
		Map<String,Object> maps2 = new HashMap<String,Object>();
		try {
			List<Donation> list = donationService.getCategoryPage(categoryId);
			for(int i = 0 ; i<list.size() ; i++) {
				
				maps1.put(Integer.toString(i+1),list.get(i));
				}
				message = "yes";
				maps2.put("message",message);
				maps.put("Donation",maps1);
				maps.put("message",maps2);
				
			return maps;
		} catch (Exception e) {
			maps2.put("message", message);
			maps.put("message",maps2);
			return maps;
		}
	}
	
//	@GetMapping("getDoantionDetail.do") //상세 기부 페이지
//	public String detailPage(String donationId, Model model) {
//		String message = "No";
//		Map<String,Object> maps = new HashMap<String,Object>();
//		
//		try {
//			Donation detail = donationService.getDoantionDetail(donationId);
//			System.out.println(detail);
//			maps.put("donation", detail);
//			message = "yes";
//			maps.put("message", message);
//			return "Content";
//			
//		} catch (Exception e) {
//			
//			maps.put("message", message);
//			return "Error";
//		}
//	}
	@GetMapping("getDoantionDetail.do") //상세 기부 페이지
	public Map<String,Map<String,Object>> getDoantionDetail(String donationId, Model model) {
		String message = "no";
		Map<String,Map<String,Object>> maps = new HashMap<String,Map<String,Object>>();
		Map<String,Object> maps1 = new HashMap<String,Object>();
		Map<String,Object> maps2 = new HashMap<String,Object>();
		try {
			Donation detail = donationService.getDoantionDetail(donationId);		
			maps1.put("1", detail);
			maps.put("Donation",maps1);
			message = "yes";
			maps2.put("message",message);
			maps.put("message",maps2);
			return maps;
		} catch (Exception e) {
			maps2.put("message", message);
			maps.put("message",maps2);
			return maps;
		}
	}
	// [Donation history테이블]에서 해당하는 donation_id insert, [donation 테이블]에서 donation_amount 필드 업데이트(Clear), 
	// user_id에 해당하는 User의 마일리지 차감 --> [Account 테이블]의 마일리지 필드 차감(Clear)...
	// [Milege History 새로운 행 삽입](Clear)
	@PostMapping("excuteDonation.do") //기부하기
	public Map<String,Map<String,Object>> excuteDonation(Donation donation, Users user, Model model) {
		String message = "no";
		Map<String,Map<String,Object>> maps = new HashMap<String,Map<String,Object>>();
		Map<String,Object> maps1 = new HashMap<String,Object>();
		try {
			donationService.modifyDonationAmount(donation);
			Account acc2 = donationService.modifyMileage(user.getUserId(), donation.getDonationAmount());
			if(acc2.getMileage()<0) {
				message = "no Milege";
				maps1.put("message", message);
				maps.put("message",maps1);
				return maps;
				}
			else {
			donationService.modifyMileage(acc2);
			donationService.addMileageThruDonation(donation.getDonationAmount(), user.getUserId());
			donationService.addDonationHistory(donation.getDonationId(), donation.getDonationAmount(), user.getUserId());
			message = "yes";
			maps1.put("message", message);
			maps.put("message",maps1);
			return maps;
			}
		} catch (Exception e) {
			message = "error";
			maps1.put("message", message);
			maps.put("message",maps1);
			return maps;
		}
	}		
	@PostMapping("getDonationStatistic.do") //유저별 기부 통계
	public Map<String,Object> getDonationStatistic(Integer userId) {
		String message = "no";
		Map<String, Object> maps = new HashMap<String,Object>();
		try {
			List<HashMap<String,Object>> data = donationService.getDonationStatistic(userId);
			if(data!=null && data.size() > 0) {
				message = "yes";
				//System.out.println(data.size());
				if(data.size() == 1) {
					maps = data.get(0);
				}
				else {
					Object index = 0;
					for(HashMap<String,Object> m : data) {
						if(m!=null) {
							index = m.get("userId");
							maps.put(index+"",m);
						}
					}
				}
			}
			maps.put("message",message);
			return maps;
		} catch (Exception e) {
			message = "error";
			maps.put("message",message);
			return maps;
		}
	}
	@PostMapping("getDonationStatistic2.do") //유저별 기부 통계2
	public Map<String,Object> getDonationStatistic2(Integer userId) {
		String message = "no";
		Map<String, Object> maps = new HashMap<>();
		try {
			HashMap<String, Object> data = donationService.getDonationStatistic2(userId);
			if(data!=null && userId != null) {
				maps = data;
			}
			else maps.put("message",message);
			return maps;
		
		 } catch (Exception e) {
		 System.out.println("Error :"+e.getMessage()+e.toString());
		 e.printStackTrace(); message = "error"; maps.put("message",message);
		 return maps;
		 }
	}
}
