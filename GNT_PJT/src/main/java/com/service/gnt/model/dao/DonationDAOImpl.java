package com.service.gnt.model.dao;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.domain.donation.Donation;
import com.service.gnt.domain.donation.DonationHistory;
import com.service.gnt.domain.users.Users;
@Repository
public class DonationDAOImpl implements DonationDAO{
	private final String NS = "ns.sql.DonationMapper.";
	public final String UM = "ns.sql.UserMapper.";
	public final String AM = "ns.sql.AccountMapper.";
	@Autowired
	private SqlSession sqlSession;
	
	public List<Donation> getDonationAsk() {
		return sqlSession.selectList(NS+"selectDonationAsk");
	}
	public List<Donation> getCategoryPage(int categoryId) {
		return sqlSession.selectList(NS+"selectCategoryPage",categoryId);
	}
	public List<Donation> getDonationPage(int k) {
		return sqlSession.selectList(NS+"selectDonationPage",k);
	}
	public Donation getDoantionDetail(String donationId) {
		return sqlSession.selectOne(NS+"selectDonationDetail",donationId);
	}
	public int modifyDonationAmount(Donation donation) {
		return sqlSession.update(NS+"updateDonationAmount",donation);
	}
	public int modifyMileage(Account account) {
		return sqlSession.update(NS+"updateMileage",account);
	}
	public Account getAccountByUserId(int userId) {
		return getAccount(getAccIdByUserId(userId));
	}
	public String getAccIdByUserId(int userId) {
		return sqlSession.selectOne(UM+"selectAccIdByUserId",userId);
	}
	public Account getAccount(String accId) {
		return sqlSession.selectOne(AM+"selectAccount",accId);
	}
	public Account modifyMileage(int userId, int donationAmount) {
		Account acc1 = getAccountByUserId(userId);
		acc1.setMileage(acc1.getMileage()-donationAmount);
		return acc1;
	}
	public int addMileageThruDonation(int donationAmount, int userId) {
		String accId1 = getAccIdByUserId(userId);
	return sqlSession.insert(AM+"insertMileageHistory", new MileageHistory(accId1,(-1)*donationAmount,"기부"));
	}
	public int addDonationHistory(String donationId, int donationAmount, int userId) {
		return sqlSession.insert(NS+"insertDonationHistory", new DonationHistory(donationId, donationAmount,userId));
	}
	public List<HashMap<String,Object>> getDonationStatistic(Integer userId) {
		List<HashMap<String,Object>> result = sqlSession.selectList(NS+"selectDonationStatistic", userId);
		return result;
	}
	public HashMap<String, Object> getDonationStatistic2(Integer userId){
		List<DonationHistory> data = sqlSession.selectList(NS+"selectDonationHistory", userId);
		HashMap<String, Object> result = new LinkedHashMap<String, Object>();
		int categoryId = 0;
		int cat1 = 0;
		int cat2 = 0;
		int cat3 = 0;
		int cat4 = 0;
		int cat5 = 0;
		int cat6 = 0;
		int cat7 = 0;
		int cat8 = 0;
		double cat1p = 0;
		double cat2p = 0;
		double cat3p = 0;
		double cat4p = 0;
		double cat5p = 0;
		double cat6p = 0;
		double cat7p = 0;
		double cat8p = 0;
		int total = 0;
		int damount = 0;
		int cnt = DonationHistoryIsNA(userId);
		if(cnt>0) {
			for(DonationHistory m : data) {
				if(m!=null) {
					categoryId = getDonationCategoryId(m.getDonationId());
					total++;
					damount += m.getAmount();
					switch (categoryId) {
					case 1:
						cat1++;
						break;
					case 2:
						cat2++;
						break;
					case 3:
						cat3++;
						break;
					case 4:
						cat4++;
						break;
					case 5:
						cat5++;
						break;
					case 6:
						cat6++;
						break;
					case 7:
						cat7++;
						break;
					case 8:
						cat8++;
						break;
					default:
						break;
					}
				}
			}
			cat1p = Math.round(cat1/(double)total*10)/10.0;
			cat2p = Math.round(cat2/(double)total*10)/10.0;
			cat3p = Math.round(cat3/(double)total*10)/10.0;
			cat4p = Math.round(cat4/(double)total*10)/10.0;
			cat5p = Math.round(cat5/(double)total*10)/10.0;
			cat6p = Math.round(cat6/(double)total*10)/10.0;
			cat7p = Math.round(cat7/(double)total*10)/10.0;
			cat8p = Math.round(cat8/(double)total*10)/10.0;
			result.put("message","yes");
			result.put("user_id",userId);
			result.put("user_name", ((Users) sqlSession.selectOne(UM+"selectUserById",userId)).getUserName());
			result.put("donation_cnt",cnt);
			result.put("donation_amount", damount);
			result.put("category_childern",cat1p);
			result.put("category_oldman",cat2p);
			result.put("category_disabled",cat3p);
			result.put("category_multiculture",cat4p);
			result.put("category_global",cat5p);
			result.put("category_family",cat6p);
			result.put("category_animal",cat7p);
			result.put("category_environment",cat8p);
		}
		else result.put("message","no");
		return result;
	}

	public int getDonationCategoryId(String donationId) {
		return sqlSession.selectOne(NS+"selectDonationCategoryId",donationId);
	}
	
	public int DonationHistoryIsNA(Integer userId) {
		return sqlSession.selectOne(NS+"selectDonationHistoryIsNA",userId);
	}
}
