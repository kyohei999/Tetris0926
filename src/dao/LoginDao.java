package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.User;

public class LoginDao {

	public User getUserdata(User user) {

		try {
			String url = "jdbc:postgresql://localhost:5432/tetris";
			String dbUser = "postgres";
			String dbPassword = "root";
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

			String sql = "select tetris_id, tetris_name, tetris_pass from tetris"
					+ " where tetris_id = ? and \"tetris_pass\" = ?;";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getId());
			ps.setString(2, user.getPass());

			ResultSet rs = ps.executeQuery();
			User userNew = null;
			while (rs.next()) {

				userNew = new User();
				userNew.setId(rs.getString("tetris_id"));
				userNew.setName(rs.getString("tetris_name"));
				userNew.setPass(rs.getString("tetris_pass"));


			}

			ps.close();
			con.close();
			return  userNew;



		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}


		return null;


	}

	public boolean create(User user) {

		try {
			String url = "jdbc:postgresql://localhost:5432/tetris";
			String dbUser = "postgres";
			String dbPassword = "root";
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, dbUser, dbPassword);


			//SQLから全てのテトリスID取得
			String sql9 = "select tetris_id  from tetris;";
			PreparedStatement ps9 = con.prepareStatement(sql9);
			ResultSet rs9 = ps9.executeQuery();

		    List<String> id = null;
		    id =new ArrayList<String>();
			while (rs9.next()) {
				id.add(rs9.getString("tetris_id"));
			}
			//SQLから全てのテトリスID取得


			String sql = "insert into tetris (" + "  tetris_id," + "  tetris_name," + " tetris_pass" + ") values ("
					+ "  ?," + "  ?," + "  ?" + ");";
			PreparedStatement ps = con.prepareStatement(sql);

			//データベースのテトリスIDと被っていないかチェック
			if (!(id.contains(user.getId()) ) &&
					user.getId().length() >= 4 && user.getId().length() <= 16 &&
					user.getName().length() >= 4 && user.getName().length() <= 16 &&
							user.getPass().length() >= 4 && user.getPass().length() <= 16) {

				ps.setString(1, user.getId());
				ps.setString(2, user.getName());
				ps.setString(3, user.getPass());

				ps.executeUpdate();

				ps.close();
				con.close();


				return true;
			}else {
				return false;

			}



		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
			return false;
		}



	}

}
