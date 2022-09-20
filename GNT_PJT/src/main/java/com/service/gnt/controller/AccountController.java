package com.service.gnt.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.model.service.AccountService;
import io.swagger.annotations.ApiOperation;
@RestController
public class AccountController {
	@Autowired
	private AccountService accountService;
	@ApiOperation(value="createAcc", notes="계좌 생성")
	@PostMapping("createAccount.do")
	public Map<String,Object> createAccount(@RequestParam int userId,@RequestParam String accPassword,@RequestParam String userNameEng,
			@RequestParam String address, @RequestParam String phone, Model model) {
		Map<String,Object> maps = new HashMap<>();
		try {
			String status = "no";
			Account account = accountService.createAccount(userId, accPassword, userNameEng, address, phone);
			if(account!=null) {
				status = "yes";
				maps.put("account", account);
			}			
			maps.put("message", status);
		} catch(Exception e) {
			maps.put("message", "error");
		}
		return maps;
	}
	@ApiOperation(value="checkUserAccount", notes="계좌 존재유무 확인")
	@GetMapping("checkUserAccount.do")
	public Map<String,Object> checkUserAccount(int userId) {
		Map<String,Object> maps = new HashMap<>();
		try {
			maps.put("message", accountService.checkUserAccount(userId));
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message","no");
			return maps;
		}
	}
	@ApiOperation(value="checkUserAccPassword", notes="계좌 비밀번호 확인")
	@PostMapping("/checkUserAccPassword.do")
	public Map<String,Object> checkUserAccPasword(int userId, String accPassword) {
		Map<String,Object> maps = new HashMap<>();
		try {
			maps.put("message", accountService.checkUserAccPasword(userId,accPassword));
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message","no");
			return maps;
		}
	}
	@ApiOperation(value="getAccount", notes="계좌 정보 확인") //비정상 작동 WIP
	@PostMapping("getAccount.do")
	public Map<String,Object> getAccount(int userId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			Account data = accountService.getAccountByUserId(userId);
			if(data!=null) {
				status = "yes";
				maps.put("account", data);
			}			
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			maps.put("message", status);
			System.out.println(userId);
			System.out.println("Error :"+e.getMessage()+e.toString());
			return maps;
		}
	}
	@ApiOperation(value="depositAccount", notes="계좌 입금")
	@PutMapping("depositAccount.do")
	public Map<String,Object> depositAccount(int userId, int amount) {
			Map<String,Object> maps = new HashMap<>();
			String status = "no";
		try {
			if(accountService.depositAccount(userId, amount)>0){
				status = "yes";
			}
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
	@ApiOperation(value="sendAccount", notes="송금")
	@PutMapping("sendAccount.do")
	public Map<String,Object> sendAccount(int userId, int amount, String accId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			status = accountService.sendAccount(userId, amount, accId);
			maps.put("message", status);
			maps.put("amount",amount);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
	@ApiOperation(value="createMileage", notes="마일리지 생성")
	@PostMapping("createMileage.do")
	public Map<String,Object> createMileage(int userId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			if(accountService.createMileage(userId)>0) {
				status="yes";
				maps.put("mileageHisstory", accountService.addMileage(0, userId));
			}
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
	@ApiOperation(value="getMileBalance", notes="마일리지 잔액 확인")
	@PostMapping("getMileageBalance.do")
	public Map<String,Object> getMileageBalance(int userId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			Object data = accountService.getMileageBalance(userId);
			if(data!=null){
				status = "yes";
				maps.put("mileage", data);
			}
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
	@ApiOperation(value="getMileageHistory", notes="마일리지 내역 확인")
	@PostMapping("getMileageHistory.do")
	public Map<String,Object> getMileageHistory(int userId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			List<MileageHistory> data = accountService.getMileageHistory(userId);
			if(accountService.getMileageHistoryCount(userId)>0) {
				status = "yes";
				maps.put("mileageHistory", data);
				maps.put("mileageBalance",accountService.getMileageBalance(userId));
			}
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
	@ApiOperation(value="addMileage", notes="마일리지 충전")
	@PutMapping("addMileage.do")
	public Map<String,Object> addMileage(int amount, int userId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			Object data = accountService.addMileage(amount, userId);
			if(data!=null){
				status = "yes";
				maps.put("mileage", data);
				maps.put("mileageBalance",accountService.getMileageBalance(userId));
			}
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			status = "error";
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
}
