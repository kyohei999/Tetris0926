package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Rank;

public class RankingDao {

	public List<Rank>findRank(){
		List<Rank> rankList = new ArrayList<>();

		try {
			String url = "jdbc:postgresql://localhost:5432/tetris";
			String dbUser = "postgres";
			String dbPassword = "0926mrmr";
			Class.forName("org.postgresql.Driver");

			Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

			String sql = "select tetris_id, tetris_name, score from ranking order by score desc;";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				String id = rs.getString("tetris_id");
				String name = rs.getString("tetris_name");
				int score = rs.getInt("score");
				Rank rank = new Rank(id, name, score);
				rankList.add(rank);
			}

			ps.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return rankList;

	}

	public boolean create(Rank rank) {

		try {
			String url = "jdbc:postgresql://localhost:5432/tetris";
			String dbUser = "postgres";
			String dbPassword = "0926mrmr";
			Class.forName("org.postgresql.Driver");

			Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

			String sql =
			 "insert into ranking (tetris_id, tetris_name, score) values (?, ?, ?);";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, rank.getId());
			ps.setString(2, rank.getName());
			ps.setInt(3, rank.getScore());

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
