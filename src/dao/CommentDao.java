package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Comment;

public class CommentDao {

	public List<Comment> getCommentdata() {

		try {
			String url = "jdbc:postgresql://localhost:5432/tetris";
			String dbUser = "postgres";
			String dbPassword = "0926mrmr";
			Class.forName("org.postgresql.Driver");

			Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

			//SQL
			String sql = "select comment_name, comment_text from comment;";
			PreparedStatement ps = con.prepareStatement(sql);
			//SQL
			ResultSet rs = ps.executeQuery();


			Comment commentNew = null;
			List<Comment> commentList = null;
			commentList = new ArrayList<>();

			//レコードの数だけインスタンス生成して繰り返す？
			while (rs.next()) {

				commentNew = new Comment();
				commentNew.setName(rs.getString("comment_name"));
				commentNew.setText(rs.getString("comment_text"));

				commentList.add(commentNew);

			}

			ps.close();
			con.close();
			return commentList;

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}

		return null;

	}

	public boolean create(Comment comment) {

		try {
			String url = "jdbc:postgresql://localhost:5432/tetris";
			String dbUser = "postgres";
			String dbPassword = "0926mrmr";
			Class.forName("org.postgresql.Driver");

			Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

			//SQL参考
			//String sql = "INSERT INTO tetris (tetris_id, tetris_name, tetris_pass,) VALUES (" + "?," + "?," + "?"
			//		+ ");";

			String sql = "insert into comment (" + "  comment_name," + "  comment_text" + ") values ("
					+ "  ?," + "  ?" + ");";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, comment.getName());
			ps.setString(2, comment.getText());

			ps.executeUpdate();

			ps.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}

		return true;
	}

}
