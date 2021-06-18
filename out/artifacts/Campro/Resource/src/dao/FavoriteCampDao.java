package dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavoriteCampDao {
	private static FavoriteCampDao instance;

	private FavoriteCampDao() {

	}

	public static FavoriteCampDao getInstance() {
		if (instance == null) {
			instance = new FavoriteCampDao();
		}
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
//	public List<FavoriteCamp> list(String user_id)
	public List<FavoriteCamp> list(String user_id) throws SQLException {
		List<FavoriteCamp> list = new ArrayList<FavoriteCamp>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from camp_user_info where user_id = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FavoriteCamp favoritecamp = new FavoriteCamp();
				favoritecamp.setCamp_id(Integer.parseInt(rs.getString(1)));
				favoritecamp.setUser_id(rs.getString(2));
				favoritecamp.setCamp_name(rs.getString(3));
				list.add(favoritecamp);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			if (rs != null)
				rs.close();
		}
		return list;
	}

}
