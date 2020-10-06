package model;

import dao.LoginDao;
import entity.User;

public class PostUserDataLogic {
	public boolean execute(User user) {
		LoginDao dao = new LoginDao();
		return dao.create(user);


	}

}
