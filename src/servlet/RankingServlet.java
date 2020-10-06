package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Rank;
import model.GetRankLogic;

/**
 * ランキングサーブレット
 */
@WebServlet("/RankingServlet")
public class RankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Rank> rankList = GetRankLogic.execute();

		if(rankList.size()>0) {
			Rank rank1 = rankList.get(0);
			request.setAttribute("rank1", rank1);
		}
		if(rankList.size()>1) {
			Rank rank2 = rankList.get(1);
			request.setAttribute("rank2", rank2);
		}
		if(rankList.size()>2) {
			Rank rank3 = rankList.get(2);
			request.setAttribute("rank3", rank3);
		}
		if(rankList.size()>3) {
			Rank rank4 = rankList.get(3);
			request.setAttribute("rank4", rank4);
		}
		if(rankList.size()>4) {
			Rank rank5 = rankList.get(4);
			request.setAttribute("rank5", rank5);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/ranking.jsp");
		dispatcher.forward(request, response);
	}
}
