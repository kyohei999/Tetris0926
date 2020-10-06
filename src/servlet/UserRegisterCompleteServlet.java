package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import model.PostUserDataLogic;

@WebServlet("/UserRegisterCompleteServlet")
public class UserRegisterCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {




	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//userRegisterからリクエストパラメータ取得
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");

		//登録ユーザーの情報を設定
		User user = new User(id, name, pass);

		//条件を満たしたらデータベースにデータ登録
		PostUserDataLogic postUserDataLogic = new PostUserDataLogic();
		boolean isTrue;
		//データベースに登録できたか判定
		isTrue = postUserDataLogic.execute(user);

		if (isTrue == true) {
			request.setAttribute("user", user);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userRegisterComplete.jsp");
			dispatcher.forward(request, response);

		} else {
			request.setAttribute("message", "ユーザID,ユーザ名,パスワードは4～16文字以内で入力してください。"
					+ "もしくはIDがほかのユーザーと被っています");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userRegister.jsp");
			dispatcher.forward(request, response);
		}
	}

}
