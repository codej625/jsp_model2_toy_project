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

public class MemberDao {
	private static MemberDao instance;

	private MemberDao() {

	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
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
	
	// 회원가입
	public int insert(Member member) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String sql = "Insert into USER_INFO (USER_ID,USER_PW,USER_NAME,USER_TEL,USER_ADDR,USER_EMAIL,USER_GENDER, USER_REG) values(?,?,?,?,?,?,?,sysdate)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUser_id());
			pstmt.setString(2, member.getUser_pw());
			pstmt.setString(3, member.getUser_name());
			pstmt.setString(4, member.getUser_tel());
			pstmt.setString(5, member.getUser_addr());
			pstmt.setString(6, member.getUser_email());
			pstmt.setString(7, member.getUser_gender());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	// 로그인
	public int check(String user_id, String user_pw) throws SQLException {	
		Member member = new Member();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		String sql = "select user_pw from user_info where user_id=? and user_drop=0";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPasswd = rs.getString(1);
				if (dbPasswd.equals(user_pw)) result = 1;	// 비밀번호 일치
				else result = 0;	// 비밀번호 불일치
			} else result = -1;		// 회원정보 없음
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			if (rs != null) rs.close();
		}
		return result;
	}

	// 회원정보 불러오기
	public Member select(String user_id) throws SQLException {
		Member member = new Member();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select user_id,user_pw,user_name,user_tel,user_addr,user_email,user_gender from user_info where user_id =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setUser_id(rs.getString(1));
				member.setUser_pw(rs.getString(2));
				member.setUser_name(rs.getString(3));
				member.setUser_tel(rs.getString(4));
				member.setUser_addr(rs.getString(5));
				member.setUser_email(rs.getString(6));
				member.setUser_gender(rs.getString(7));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			if (rs != null) rs.close();
		}
		return member;
	}
	
	// 이메일 중복 확인
	public Member selectEmail(String user_email) throws SQLException {
		Member member = new Member();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from user_info where user_email =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setUser_id(rs.getString(1));
				member.setUser_pw(rs.getString(2));
				member.setUser_name(rs.getString(3));
				member.setUser_tel(rs.getString(4));
				member.setUser_addr(rs.getString(5));
				member.setUser_email(rs.getString(6));
				member.setUser_gender(rs.getString(7));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			if (rs != null) rs.close();
		}
		return member;
	}
		
	// 회원정보 수정
	public int update(Member member) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String sql = "update user_info set user_pw=?,user_name=?,user_tel=?,user_addr=?,user_email=?,user_gender=?, user_pwd=sysdate where user_id=? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUser_pw());
			pstmt.setString(2, member.getUser_name());
			pstmt.setString(3, member.getUser_tel());
			pstmt.setString(4, member.getUser_addr());
			pstmt.setString(5, member.getUser_email());
			pstmt.setString(6, member.getUser_gender());
			pstmt.setString(7, member.getUser_id());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	// 회원 탈퇴여부 변경
	public int deleteUpdate(String user_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update user_info set user_drop=0 where user_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	// 회원탈퇴
	public int delete(String user_id, String user_pw) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select user_pw from user_info where user_id=?";
		String sql1 = "update user_info set user_drop=1 where user_id=?";
		 
		try {
			String dbPw = "";
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbPw = rs.getString(1);
				if(dbPw.equals(user_pw)) {
					rs.close();  
					pstmt.close();
					
					pstmt = conn.prepareStatement(sql1);
					pstmt.setString(1, user_id);
					result = pstmt.executeUpdate();
				}
			}else {
				result = -1;
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	// 이메일 중복체크
		public int EmailDupl(String user_email) throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int result = 0;
			String sql = "select * from user_info where user_email=?";
			try {
				conn  = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_email);
				rs = pstmt.executeQuery();
				System.out.println("EmailDupl rs->" + rs);
				if ( rs.next()) result = 1; // 이메일 중복: 1, 이메일 생성 가능: 0
				else result = 0;
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				if (rs != null) rs.close();
			}
			return result;
		}
	
	// 회원정보 TotalCnt
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    
	    int tot = 0;
	    String sql = "select count(*) from user_info";
	    try {
	    	conn = getConnection();
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(sql);
	        if (rs.next()) tot = rs.getInt(1);
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    } finally {
	        if (stmt != null) stmt.close();
	        if (conn != null) conn.close();
	        if (rs != null) rs.close();
	    }
	    return tot;
	}

	// 회원정보 list
	public List<Member> list(int startRow, int endRow) throws SQLException {
		List<Member> list = new ArrayList<Member>();
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    String sql = " select * from ( select rownum rn, a.* from ( select * from user_info) a ) where rn between ? and ? ";
	    try {
	    	conn = getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, startRow);
	        pstmt.setInt(2, endRow);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	Member member = new Member();
	            member.setUser_id(rs.getString("user_id"));
	            member.setUser_code(rs.getInt("user_code"));
	            member.setUser_pw(rs.getString("user_pw"));
	            member.setUser_name(rs.getString("user_name"));
	            member.setUser_tel(rs.getString("user_tel"));
	            member.setUser_addr(rs.getString("user_addr"));
	            member.setUser_email(rs.getString("user_email"));
	            member.setUser_gender(rs.getString("user_gender"));
	            member.setUser_reg(rs.getString("user_reg"));
	            member.setUser_pwd(rs.getString("user_pwd"));
	            member.setUser_drop(rs.getInt("user_drop"));
	            list.add(member);
	        }
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    } finally {
	        if (pstmt != null) pstmt.close();
	        if (conn != null) conn.close();
	        if (rs != null) rs.close();
	    }
	    return list;
	}
	
	// 아이디 찾기
	public String findId(String user_name, String user_email) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 
		//int result = 0;
		String user_id = null;
		String sql = "select user_id from user_info where user_name=? and user_email=?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user_id = rs.getString("user_id");
			} else user_id = null;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			if (rs != null) rs.close();
		}
		return user_id;
	}
	
	// 비밀번호 찾기
	public int findPw(String user_id, String user_email) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		 
		int result = 0;
		//String user_pw = null;
		String sql1 = "select user_pw from user_info where user_id=? and user_email=?";
		String sql2 = "update user_info set user_pw='1234' where user_id=? and user_email=?";
		try {
			conn  = getConnection();
			
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, user_id);
			pstmt1.setString(2, user_email);
			rs1 = pstmt1.executeQuery();
			
			if(rs1.next()) {
				//user_pw = rs1.getString("user_pw");
				result = 1;
				
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, user_id);
				pstmt2.setString(2, user_email);
				rs2 = pstmt2.executeQuery();
			} else {
				result = 0;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt1 != null) pstmt1.close();
			if (pstmt2 != null) pstmt2.close();
			if (conn != null) conn.close();
			if (rs1 != null) rs1.close();
			if (rs2 != null) rs2.close();
		}
		return result;
	}
	
	// 회원종류 선별
	public int ChkUserCode(String user_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 
		//int result = 0;
		int user_code = 0;
		String sql = "select user_code from user_info where user_id=?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user_code = rs.getInt("user_code");
			} else user_code = -1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			if (rs != null) rs.close();
		}
		return user_code;
	}
}