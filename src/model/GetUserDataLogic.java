package model;

import dao.LoginDao;
import entity.User;

public class GetUserDataLogic {

	public User execute(User user) {
		LoginDao dao = new LoginDao();

		User a = dao.getUserdata(user);

		return a;


	}

}
