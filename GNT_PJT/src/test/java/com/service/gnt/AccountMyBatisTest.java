package com.service.gnt;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.users.Users;

@SpringBootTest
public class AccountMyBatisTest {
	
	@Test
	public void createAcc() throws Exception {
		String um = "ns.sql.UserMapper.";
		String am = "ns.sql.AccountMapper.";
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		System.out.println("유저가 생성되어 있어야 테스트 가능하니 먼저 CommonMyBatisTest.java를 실행해서 유저를 만들어 주세요.");
		System.out.println("createAcc Method Unit Test");
		System.out.println("해당 테스트에서는 계좌를 생성한 뒤 추가 입력받은 정보를 Users에 입력합니다.");
		Users user = new Users("aa@naver.com", "AAA", "12355");
		int userId = session.selectOne(um+"selectUserId",user); //테스트할 유저 이메일, 이름, 비밀번호를 입력하거나 userId를 넣어주세요.
		System.out.println("User Id : "+userId);
		String accId = "";
		while(true) {
			accId = session.selectOne(am+"createAccKey");
			if(session.selectOne(am+"validateAccId", accId).equals("0")) {
				break; //난수생성한 계좌가 겹치지 않을 경우 실행
			};
		}
		System.out.println("생성된 계좌번호 : "+accId);
		session.insert(am+"insertAccount", new Account(accId, "1515"));
		Users vo = new Users(userId, accId, "EngName", "산포시", "01012341234");
		session.update(um+"updateUserInfo", vo);
		System.out.println("유저 추가정보 [계좌번호, 영문명, 주소, 전화번호] 기입 완료");
		session.commit();
	}
	
	@Test
	public void depositAcc() throws Exception {
		String um = "ns.sql.UserMapper.";
		String am = "ns.sql.AccountMapper.";
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		Users user = new Users("aa@naver.com", "AAA", "12355");
		int userId = session.selectOne(um+"selectUserId",user);
		String accId = session.selectOne(um+"selectAccIdByUserId",userId);
		System.out.println("사용자의 계좌로 특정 금액을 입금합니다.");
		session.update(am + "updateAccountAmount", new Account(accId, 5000, 0));
		int message = session.selectOne(am + "selectAccountAmount", accId);
		System.out.println("현재 잔액 : "+message+"원"); 
		session.commit();
	}
	
	@Test
	public void createMile() throws Exception{
		String um = "ns.sql.UserMapper.";
		String am = "ns.sql.AccountMapper.";
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		Users user = new Users("aa@naver.com", "AAA", "12355");
		int userId = session.selectOne(um+"selectUserId",user);
		String accId = session.selectOne(um+"selectAccIdByUserId",userId);
		System.out.println(accId);
		session.insert(am + "updateAccountIsMileage", accId);
		System.out.println("mileage 사용 ID로 등록");
	}
}
