package com.service.gnt.model.dao;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.domain.event.Game;
import com.service.gnt.domain.event.Quiz;
@Repository
public class EventDAOImpl implements EventDAO{
	@Autowired
	private SqlSession sqlSession;
	private static final String NS = "ns.sql.EventMapper.";
	public String checkQuizPlayed(int userId) throws Exception {
		return sqlSession.selectOne(NS+"selectQuizCK",userId);
	}
	public int selectQuizId(int userId) throws Exception {
		return sqlSession.selectOne(NS+"selectQuizId",userId);
	}
	public Quiz getQuiz(int quizId) throws Exception {
		Quiz quiz = sqlSession.selectOne(NS+"selectQuiz",quizId);
		return quiz;
	}
	public int getQuizAnswer(int quizId) throws Exception {
		return sqlSession.selectOne(NS+"selectQuizAnswer",quizId);
	}
	public int updateQuizUser(int userId) throws Exception {
		return sqlSession.update(NS+"updateQuizUser",userId);
	}
	public String selectQuizAccId(int userId) throws Exception {
		return sqlSession.selectOne(NS+"selectQuizAccId",userId);
	}
	public int updateQuizMileage(Account account) throws Exception {
		return sqlSession.update(NS+"updateQuizMileage",account);
	}
	public int selectMilieageHistorySeq() throws Exception {
		return sqlSession.selectOne(NS+"selectMilieageHistorySeq");
	}
	public int insertMilieage(MileageHistory mh) throws Exception {
		return sqlSession.insert(NS+"insertMilieage",mh);
	}
	
	
	public String checkRoulettePlayed(int userId) throws Exception {
		return sqlSession.selectOne(NS+"selectRouletteCK",userId);
	}

	public int updateRouletteUser(int userId) throws Exception {
		return sqlSession.update(NS+"updateRouletteUser", userId);
	}
	
	
	public int updateEventReset() throws Exception {
		return sqlSession.update(NS+"updateEventReset");
	}
	public List<Integer> selectAllUserId() throws Exception {
		List<Integer> list = sqlSession.selectList(NS+"selectAllUserId");
		return list;
	}
	
	// game
	
	
	@Override
	public int selectGameSeq() throws Exception {
		return sqlSession.selectOne(NS+"selectGameSeq");
	}
	@Override
	public int insertGame(Game game) throws Exception {
		return sqlSession.insert(NS+"insertGame", game);
	}
	@Override
	public String checkGamePlayed(int userId) throws Exception {
		return sqlSession.selectOne(NS+"selectIsToday", userId);
	}
	@Override
	public List<Game> checkGamePlayedTomorrow() throws Exception {
		List<Game> list = sqlSession.selectList(NS+"selectIsTomorrow");
		return list;
	}

	@Override
	public Game getGame(int userId) throws Exception {
		Game game = sqlSession.selectOne(NS+"selectGame", userId);
		return game;
	}
	@Override
	public int updateGame(Game game) throws Exception {
		return sqlSession.update(NS+"updateGame", game);
	}
	@Override
	public int updateGameIsTodayReset() throws Exception {
		return sqlSession.update(NS+"updateGameIsTodayReset");
	}
	@Override
	public int updateGameIsTomorrowReset(int userId) throws Exception {
		return sqlSession.update(NS+"updateGameIsTomorrowReset", userId);
	}


}
