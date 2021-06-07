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

public class PostDao {
	private static PostDao instance;

	private PostDao() {

	}

	public static PostDao getInstance() {
		if (instance == null) {
			instance = new PostDao();
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

	
	
	// 문의 게시판 게시글 수 확인
/*	public int check(int board_num) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int post_num = 0;
		String sql = "select max(post_num) from post where board_num=3";

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				post_num = rs.getInt(1);

			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
			if (rs != null) rs.close();
		}
		return post_num;
	}
*/

	// 게시글 작성
	public int insert(Post post) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into post values(?,?,?,sysdate,?,?,0,null,null,null,0) ";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post.getBoard_num());
			pstmt.setInt(2, post.getPost_num());
			System.out.println(post.getPost_num());
			pstmt.setString(3, post.getUser_id());
			System.out.println(post.getUser_id());
			pstmt.setString(4, post.getPost_name());
			pstmt.setString(5, post.getPost_cont());
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
	
	// 게시글 개수 카운트
	public int getTotalCnt(int boardNum) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int post_num = 0;
		String sql = "select count(post_num) from post where board_num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				post_num = rs.getInt(1);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return post_num;
	}
	
	// 게시글 번호 카운트
	public int getPostNum(int boardNum) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int post_num = 0;
		String sql = "select max(post_num) from post where board_num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				post_num = rs.getInt(1);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return post_num;
	}
	
	// 게시글 목록
	public List<Post> list(int startRow, int endRow, int board_num) throws SQLException {
		List<Post> list = new ArrayList<Post>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn , a.* from"
		 		+ "(select * from post where board_num=? order by post_num desc, post_re , post_restep) a )"
		 		+ "where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
	
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Post post = new Post();
				post.setBoard_num(rs.getInt("board_num"));
				post.setPost_num(rs.getInt("post_num"));
				post.setUser_id(rs.getString("user_id"));
				post.setPost_date(rs.getString("post_date"));
				post.setPost_name(rs.getString("post_name"));
				post.setPost_cont(rs.getString("post_cont"));
				post.setPost_view(rs.getInt("post_view"));
				post.setPost_re(rs.getInt("post_re"));
				post.setPost_restep(rs.getInt("post_restep"));
				post.setPost_lv(rs.getInt("post_lv"));
				post.setPost_chq(rs.getInt("post_chq"));
				
				list.add(post);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}
	
	// 게시물 선택
	public Post select(int board_num, int post_num) throws SQLException {
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn = null;
		
		String sql = "SELECT * FROM post WHERE board_num="+board_num+" and post_num="+post_num;
		//System.out.println("DAO select  sql->"+sql);
		
		Post post = new Post();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				post.setBoard_num(rs.getInt("board_num"));
				post.setPost_num(rs.getInt("post_num"));
				post.setUser_id(rs.getString("user_id"));
				post.setPost_name(rs.getString("post_name"));
				post.setPost_cont(rs.getString("post_cont"));
				post.setPost_view(rs.getInt("post_view"));
				post.setPost_date(rs.getString("post_date"));
				post.setPost_re(rs.getInt("post_re"));
				post.setPost_lv(rs.getInt("post_lv"));
				post.setPost_restep(rs.getInt("post_restep"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
		return post ;
	}
	

	// 게시물 수정
	public int update(Post post) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update post set user_id=?,post_date=sysdate,post_name=?,post_cont=? where board_num=? and post_num=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, post.getUser_id());
			pstmt.setString(2, post.getPost_name());
			pstmt.setString(3, post.getPost_cont());
			pstmt.setInt(4, post.getBoard_num());
			pstmt.setInt(5, post.getPost_num());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	// 게시물 삭제
	public int postDelete(int post_num, int board_num) throws SQLException {
		Connection conn =null;
		PreparedStatement pstmt = null;
	    
		int result = 0;
	    
		String sql = "delete from post where post_num=? and board_num=?";
		
		try {
			conn=getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			pstmt.setInt(2, board_num);
			
			System.out.println("PostDelete post_num->" + post_num);
			System.out.println("PostDelete board_num->" + board_num);
			
			result = pstmt.executeUpdate();
			System.out.println("Post Delete result->" + result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	// 첨부파일 삭제
	public int uploadDelete(int post_num, int board_num) throws SQLException {
		Connection conn =null;
	    PreparedStatement pstmt = null;
	      
	    int result_upload = 0;
	      
	    String sql = "delete from upload_file where post_num=? and board_num=?";
	    try {
	    	conn=getConnection();
	         
	        System.out.println("Delete Conn Start...");
	         
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, post_num);
	         pstmt.setInt(2, board_num);
	         
	        System.out.println("UploadDelete post_num->" + post_num);
	         System.out.println("UploadDelete board_num->" + board_num);
	         
	        result_upload = pstmt.executeUpdate();
	         
	        System.out.println("Upload Delete result->" + result_upload);
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }finally {
	        if (pstmt != null) pstmt.close();
	        if (conn !=null) conn.close();
	    }
	    return result_upload;
	}
	
}
