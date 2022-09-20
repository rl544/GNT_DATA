package com.service.gnt;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.service.gnt.domain.donation.Donation;

public class DonationMyBatisTest2 {
	
	@Test
	public void unit() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();


		List<Donation> list = session.selectList("ns.sql.DonationMapper.selectDonationAsk");
		System.out.println(list);
		
	}
	
}
