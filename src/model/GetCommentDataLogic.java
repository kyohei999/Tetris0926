package model;

import java.util.List;

import dao.CommentDao;
import entity.Comment;

public class GetCommentDataLogic {
	public List<Comment> execute() {
		CommentDao dao = new CommentDao();

		List<Comment> commentList = dao.getCommentdata();

		return commentList;


	}

}
