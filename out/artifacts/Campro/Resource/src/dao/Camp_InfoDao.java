package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Camp_InfoDto;

public class Camp_InfoDao {

	private static Camp_InfoDao instance;

	private Camp_InfoDao() {
	}

	public static Camp_InfoDao getInstance() {
		if (instance == null) {
			instance = new Camp_InfoDao();
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

	public int getTotalCnt() throws SQLException {
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn = null;
		int totCnt = 0;
		String sql = "SELECT count(*) FROM camp_info";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				totCnt = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return totCnt;
	}

	public int getTotalCntCf(int c_F) throws SQLException {
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		int totCnt = 0;
		String sql = "SELECT count(*) FROM camp_info where c_f = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_F);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totCnt = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return totCnt;
	}

	public List<Camp_InfoDto> list(int startRow, int endRow) throws SQLException {
		List<Camp_InfoDto> list = new ArrayList<Camp_InfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT rownum rn, a.* FROM" + "(SELECT * FROM camp_info ORDER BY camp_id DESC) a)"
				+ "WHERE rn BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Camp_InfoDto Camp_InfoDto = new Camp_InfoDto();
				Camp_InfoDto.setCamp_Id(rs.getInt("camp_Id"));
				Camp_InfoDto.setCamp_Name(rs.getString("camp_Name"));
				Camp_InfoDto.setCamp_Tel(rs.getString("camp_Tel"));
				Camp_InfoDto.setCamp_Addr(rs.getString("camp_Addr"));
				Camp_InfoDto.setCamp_Loc(rs.getString("camp_Loc"));
				Camp_InfoDto.setRating(rs.getInt("rating"));
				Camp_InfoDto.setReview(rs.getString("review"));
				Camp_InfoDto.setC_F(rs.getInt("c_F"));
				Camp_InfoDto.setRes_Pers(rs.getInt("res_Pers"));
				Camp_InfoDto.setRes_Cost(rs.getInt("res_Cost"));
				Camp_InfoDto.setRes_Id(rs.getString("res_Id"));
				Camp_InfoDto.setCamp_Images(rs.getString("camp_Images"));
				Camp_InfoDto.setCamp_Desc(rs.getString("camp_Desc"));
				list.add(Camp_InfoDto);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

	public List<Camp_InfoDto> listCf(int startRow, int endRow, int c_F) throws SQLException {
		List<Camp_InfoDto> listCf = new ArrayList<Camp_InfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM rn, a.* FROM (SELECT * FROM camp_info WHERE c_f = ? ORDER BY camp_id DESC) a) WHERE  rn BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_F);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Camp_InfoDto Camp_InfoDto = new Camp_InfoDto();
				Camp_InfoDto.setCamp_Id(rs.getInt("camp_Id"));
				Camp_InfoDto.setCamp_Name(rs.getString("camp_Name"));
				Camp_InfoDto.setCamp_Tel(rs.getString("camp_Tel"));
				Camp_InfoDto.setCamp_Addr(rs.getString("camp_Addr"));
				Camp_InfoDto.setCamp_Loc(rs.getString("camp_Loc"));
				Camp_InfoDto.setRating(rs.getInt("rating"));
				Camp_InfoDto.setReview(rs.getString("review"));
				Camp_InfoDto.setC_F(rs.getInt("c_F"));
				Camp_InfoDto.setRes_Pers(rs.getInt("res_Pers"));
				Camp_InfoDto.setRes_Cost(rs.getInt("res_Cost"));
				Camp_InfoDto.setRes_Id(rs.getString("res_Id"));
				Camp_InfoDto.setCamp_Images(rs.getString("camp_Images"));
				Camp_InfoDto.setCamp_Desc(rs.getString("camp_Desc"));
				listCf.add(Camp_InfoDto);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return listCf;
	}

	public Camp_InfoDto view(int camp_Id) throws SQLException {
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM camp_info WHERE camp_Id = ?";
		Camp_InfoDto Camp_InfoDto = new Camp_InfoDto();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camp_Id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Camp_InfoDto.setCamp_Id(rs.getInt("camp_Id"));
				Camp_InfoDto.setCamp_Name(rs.getString("camp_Name"));
				Camp_InfoDto.setCamp_Tel(rs.getString("camp_Tel"));
				Camp_InfoDto.setCamp_Addr(rs.getString("camp_Addr"));
				Camp_InfoDto.setCamp_Loc(rs.getString("camp_Loc"));
				Camp_InfoDto.setRating(rs.getInt("rating"));
				Camp_InfoDto.setReview(rs.getString("review"));
				Camp_InfoDto.setC_F(rs.getInt("c_F"));
				Camp_InfoDto.setRes_Pers(rs.getInt("res_Pers"));
				Camp_InfoDto.setRes_Cost(rs.getInt("res_Cost"));
				Camp_InfoDto.setRes_Id(rs.getString("res_Id"));
				Camp_InfoDto.setCamp_Images(rs.getString("camp_Images"));
				Camp_InfoDto.setCamp_Desc(rs.getString("camp_Desc"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return Camp_InfoDto;
	}
}
