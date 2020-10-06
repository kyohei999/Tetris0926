package model;

import dao.RankingDao;
import entity.Rank;

public class PostRankLogic {

	public static void execute(Rank rank) {

		RankingDao dao = new RankingDao();
		dao.create(rank);
	}
}
