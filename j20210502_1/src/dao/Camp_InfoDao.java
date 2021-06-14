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
		int totCnt = 0;
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT count(*) FROM camp_info WHERE c_f = ?";
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
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM (SELECT rownum rn, a.* FROM" + "(SELECT * FROM camp_info ORDER BY camp_id DESC) a)"
				+ "WHERE rn BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Camp_InfoDto camp_InfoDto = new Camp_InfoDto();
				camp_InfoDto.setCamp_Id(rs.getInt("camp_Id"));
				camp_InfoDto.setCamp_Name(rs.getString("camp_Name"));
				camp_InfoDto.setCamp_Tel(rs.getString("camp_Tel"));
				camp_InfoDto.setCamp_Addr(rs.getString("camp_Addr"));
				camp_InfoDto.setCamp_Loc(rs.getString("camp_Loc"));
				camp_InfoDto.setRating(rs.getInt("rating"));
				camp_InfoDto.setReview(rs.getString("review"));
				camp_InfoDto.setC_F(rs.getInt("c_F"));
				camp_InfoDto.setRes_Id(rs.getString("res_Id"));
				camp_InfoDto.setCamp_Images(rs.getString("camp_Images"));
				camp_InfoDto.setCamp_Desc(rs.getString("camp_Desc"));
				camp_InfoDto.setCamp_View1(rs.getString("camp_View1"));
				camp_InfoDto.setCamp_View2(rs.getString("camp_View2"));
				camp_InfoDto.setCamp_View3(rs.getString("camp_View3"));
				camp_InfoDto.setCamp_Item(rs.getString("camp_Item"));
				list.add(camp_InfoDto);
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
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM (SELECT ROWNUM rn, a.* FROM (SELECT * FROM camp_info WHERE c_f = ? ORDER BY camp_id DESC) a) WHERE  rn BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_F);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Camp_InfoDto camp_InfoDto = new Camp_InfoDto();
				camp_InfoDto.setCamp_Id(rs.getInt("camp_Id"));
				camp_InfoDto.setCamp_Name(rs.getString("camp_Name"));
				camp_InfoDto.setCamp_Tel(rs.getString("camp_Tel"));
				camp_InfoDto.setCamp_Addr(rs.getString("camp_Addr"));
				camp_InfoDto.setCamp_Loc(rs.getString("camp_Loc"));
				camp_InfoDto.setC_F(rs.getInt("c_F"));
				camp_InfoDto.setRes_Id(rs.getString("res_Id"));
				camp_InfoDto.setCamp_Images(rs.getString("camp_Images"));
				camp_InfoDto.setCamp_Desc(rs.getString("camp_Desc"));
				camp_InfoDto.setCamp_View1(rs.getString("camp_View1"));
				camp_InfoDto.setCamp_View2(rs.getString("camp_View2"));
				camp_InfoDto.setCamp_View3(rs.getString("camp_View3"));
				camp_InfoDto.setCamp_Item(rs.getString("camp_Item"));
				listCf.add(camp_InfoDto);
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
		Camp_InfoDto camp_InfoDto = new Camp_InfoDto();
		String sql = "SELECT * FROM camp_info WHERE camp_Id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camp_Id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				camp_InfoDto.setCamp_Id(rs.getInt("camp_Id"));
				camp_InfoDto.setCamp_Name(rs.getString("camp_Name"));
				camp_InfoDto.setCamp_Tel(rs.getString("camp_Tel"));
				camp_InfoDto.setCamp_Addr(rs.getString("camp_Addr"));
				camp_InfoDto.setCamp_Loc(rs.getString("camp_Loc"));
				camp_InfoDto.setC_F(rs.getInt("c_F"));
				camp_InfoDto.setRes_Id(rs.getString("res_Id"));
				camp_InfoDto.setCamp_Images(rs.getString("camp_Images"));
				camp_InfoDto.setCamp_Desc(rs.getString("camp_Desc"));
				camp_InfoDto.setCamp_View1(rs.getString("camp_View1"));
				camp_InfoDto.setCamp_View2(rs.getString("camp_View2"));
				camp_InfoDto.setCamp_View3(rs.getString("camp_View3"));
				camp_InfoDto.setCamp_Item(rs.getString("camp_Item"));
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
		return camp_InfoDto;
	}

	public int insert(Camp_InfoDto camp_InfoDto) throws SQLException {
		int result = 0;
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO camp_Info"
				+ "(camp_Id, camp_Name, camp_Tel, camp_Addr, camp_Loc, c_F, res_Id, camp_Desc, camp_Images, camp_View1, camp_View2, camp_View3, camp_Item)"
				+ " VALUES(camp_info_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, camp_InfoDto.getCamp_Name());
			pstmt.setString(2, camp_InfoDto.getCamp_Tel());
			pstmt.setString(3, camp_InfoDto.getCamp_Addr());
			pstmt.setString(4, camp_InfoDto.getCamp_Loc());
			pstmt.setInt(5, camp_InfoDto.getC_F());
			pstmt.setString(6, camp_InfoDto.getRes_Id());
			pstmt.setString(7, camp_InfoDto.getCamp_Desc());
			pstmt.setString(8, camp_InfoDto.getCamp_Images());
			pstmt.setString(9, camp_InfoDto.getCamp_View1());
			pstmt.setString(10, camp_InfoDto.getCamp_View2());
			pstmt.setString(11, camp_InfoDto.getCamp_View3());
			pstmt.setString(12, camp_InfoDto.getCamp_Item());

			result = pstmt.executeUpdate();
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
		return result;
	}

	public Camp_InfoDto select(int camp_Id) throws SQLException {
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn = null;
		Camp_InfoDto camp_InfoDto = new Camp_InfoDto();
		String sql = "SELECT * FROM camp_Info WHERE camp_id =" + camp_Id;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				camp_InfoDto.setCamp_Id(rs.getInt("camp_id"));
				camp_InfoDto.setCamp_Name(rs.getString("camp_Name"));
				camp_InfoDto.setCamp_Tel(rs.getString("camp_TeL"));
				camp_InfoDto.setCamp_Addr(rs.getString("camp_Addr"));
				camp_InfoDto.setCamp_Loc(rs.getString("camp_Loc"));
				camp_InfoDto.setC_F(rs.getInt("c_F"));
				camp_InfoDto.setRes_Id(rs.getString("res_Id"));
				camp_InfoDto.setCamp_Desc(rs.getString("camp_Desc"));
				camp_InfoDto.setCamp_Images(rs.getString("camp_Images"));
				camp_InfoDto.setCamp_View1(rs.getString("camp_View1"));
				camp_InfoDto.setCamp_View2(rs.getString("camp_View2"));
				camp_InfoDto.setCamp_View3(rs.getString("camp_View3"));
				camp_InfoDto.setCamp_Item(rs.getString("camp_Item"));
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
		return camp_InfoDto;
	}

	public int update(Camp_InfoDto camp_InfoDto) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE camp_Info SET camp_Name = ?, camp_Tel = ?, camp_Addr = ?, camp_Loc = ?, c_F = ?, res_Id = ?, camp_Desc = ?, camp_Images = ?, camp_View1 = ?, camp_View2 = ?, camp_View3 = ?, camp_Item = ? WHERE camp_Id = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, camp_InfoDto.getCamp_Name());
			pstmt.setString(2, camp_InfoDto.getCamp_Tel());
			pstmt.setString(3, camp_InfoDto.getCamp_Addr());
			pstmt.setString(4, camp_InfoDto.getCamp_Loc());
			pstmt.setInt(5, camp_InfoDto.getC_F());
			pstmt.setString(6, camp_InfoDto.getRes_Id());
			pstmt.setString(7, camp_InfoDto.getCamp_Desc());
			pstmt.setString(8, camp_InfoDto.getCamp_Images());
			pstmt.setString(9, camp_InfoDto.getCamp_View1());
			pstmt.setString(10, camp_InfoDto.getCamp_View2());
			pstmt.setString(11, camp_InfoDto.getCamp_View3());
			pstmt.setString(12, camp_InfoDto.getCamp_Item());
			pstmt.setInt(13, camp_InfoDto.getCamp_Id());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
}
