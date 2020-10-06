package model;

import java.util.List;

import dao.RankingDao;
import entity.Rank;

public class GetRankLogic {

	public static List<Rank> execute() {

		RankingDao dao = new RankingDao();
		List<Rank> rankList = dao.findRank();

		return rankList;
	}
}
