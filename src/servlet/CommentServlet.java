package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Comment;
import model.GetCommentDataLogic;
import model.PostCommentDataLogic;

/**
 * コメントサーブレット
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/comment.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//名前はセッションスコープからとる

		//リクエストパラメータ取得
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String text = request.getParameter("text");

		//データベースに名前とテキストを登録
		Comment comment  = new Comment(name,text);
		PostCommentDataLogic postCommentDataLogic = new PostCommentDataLogic();
		postCommentDataLogic.execute(comment);

		//データベースから名前とテキストを保持したインスタンスを取得してアプリケーションスコープに保存
		GetCommentDataLogic getCommentDataLogic = new GetCommentDataLogic();
		List<Comment> commentList = getCommentDataLogic.execute();

		ServletContext applition = this.getServletContext();
		applition.setAttribute("commentList", commentList);


		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/comment.jsp");
		dispatcher.forward(request, response);


	}
}