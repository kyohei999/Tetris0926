package model;

import dao.CommentDao;
import entity.Comment;

public class PostCommentDataLogic {
	public void execute(Comment comment) {
		CommentDao dao = new CommentDao();
		dao.create(comment);
	}

}
