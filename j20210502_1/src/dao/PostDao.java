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
		if(instance == null) {
			instance = new PostDao();
		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
					ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	//게시글 총 갯수 , 댓글 총 갯수
	public int getTotalCnt(int board_num) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from post where board_num = ? and post_restep = 0";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				tot = rs.getInt(1);
			}
			
		} 
		catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} 
		finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	// 내가쓴 게시글 개수 카운트
		public int getTotalCnt1(String user_id) throws SQLException {
			Connection conn = null;	
			PreparedStatement pstmt= null; 
			ResultSet rs = null;    
			int post_num = 0;
			String sql = "select count(post_num) from post where user_id = ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					post_num = rs.getInt(1);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage()); 
			}finally {
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn !=null) conn.close();
			}
			return post_num;
		}
		// 게시글 개수 카운트
		public int getTotalCnt2(int boardNum) throws SQLException {
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
		
	//게시판 리스트
	public List<Post> list(int startRow, int endRow, int board_num) throws SQLException {
		List<Post> list = new ArrayList<Post>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn , a.* from"
		 		+ "(select * from post where board_num=? and post_restep = 0 order by post_num desc, post_re , post_restep) a )"
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
	// 내가쓴 글 목록
		public List<Post> list1(int startRow, int endRow, String user_id) throws SQLException{
			List<Post> list1 = new ArrayList<Post>();
			Connection conn = null;	
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			String sql = "select * from (select rownum rn , a.* from"
			 		+ "(select * from post where user_id=? order by post_num desc, post_re , post_restep) a )"
			 		+ "where rn between ? and ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_id);
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
					list1.add(post);
				}	
			} catch (Exception e) {
				System.out.println(e.getMessage()); 
			}finally {
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn !=null) conn.close();
			} 
			return list1;
		}
		
	//댓글 리스트
	public List<Post> comment_list(int board_num, int post_num) throws SQLException {
		List<Post> comment_list = new ArrayList<Post>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn , a.* from"
		 		+ "(select * from post where board_num=? and post_re =? "
		 		+ "order by post_re , post_restep, post_lv) a )"
		 		+ "where post_restep > 0";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, post_num);
		
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
				
				comment_list.add(post);
			}
		} 
		catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return comment_list;
	}
	// 문의게시글 목록
		public List<Post> askList(int startRow, int endRow, int board_num, String user_id) throws SQLException {
			List<Post> list = new ArrayList<Post>();
			Connection conn = null;	
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			 String sql = "select * from (select rownum rn , a.* from"
			 		+ "(select * from post where board_num=? and user_id=? order by post_num, post_re , post_restep) a )"
			 		+ "where rn between ? and ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, board_num);
				pstmt.setString(2, user_id);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
		
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
		// 게시글 목록
		public List<Post> askList1(int startRow, int endRow, int board_num) throws SQLException {
			List<Post> list = new ArrayList<Post>();
			Connection conn = null;	
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			 String sql = "select * from (select rownum rn , a.* from"
			 		+ "(select * from post where board_num=? order by post_re desc, post_restep) a )"
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
	
	//게시판 조회수
	public void readCount(int board_num, int post_num) throws SQLException {
		Connection conn = null;   
		PreparedStatement pstmt= null; 
	    String sql="update post set post_view=post_view+1 where board_num=? and post_num=?";
	    System.out.println("DAO readCount  sql->"+sql);
	    
	    try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, post_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	    finally {
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	    return;
	}
	
	public Post select(int board_num, int post_num) throws SQLException {
		  ResultSet rs = null;
	      Statement stmt = null;
	      Connection conn = null;
	      String sql = "SELECT * FROM post WHERE board_num="+board_num+" and post_num="+post_num;
	      System.out.println("DAO post select  sql->"+sql);
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
	            post.setPost_chq(rs.getInt("post_chq"));    
	         }
	      } 
	      catch (Exception e) {
	         System.out.println(e.getMessage());
	      } 
	      finally {
	         if (rs != null)
	            rs.close();
	         if (stmt != null)
	            stmt.close();
	         if (conn != null)
	            conn.close();
	      }
		return post ;
	}
	//게시판 수정
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
	//게시판 삭제
	public int postDelete(int board_num, int post_num) throws SQLException {
		Connection conn =null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from post where board_num=? and post_num=?";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, post_num);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
	}
		return result;
}
	   //게시글 작성 & 댓글 작성
	   public int insert(Post post) throws SQLException {
		Connection conn = null;   
        PreparedStatement pstmt= null; 
        ResultSet rs = null;
        
        int result = 0;     
        int post_num = post.getPost_num();
        int post_restep = post.getPost_restep();
        int post_lv = post.getPost_lv();
        
//        int new_post_restep = 0;
        System.out.println("post_num: "+post_num);
        System.out.println("post_restep: "+post_restep);
        
        String sql1 = "select nvl(max(post_num),1) from post where board_num = ?";
        System.out.println("DAO insert sql1->"+sql1);
        String sql = "select nvl(max(post_restep),0) from post where post_re = ?";
        String sql2 = "insert into post values(?,?,?,sysdate,?,?,0,?,?,?,0)";
        System.out.println("DAO insert sql2->"+sql2);
//        String sql3= "update post set post_restep = post_restep + 1 where post_re =? and post_restep > ?"; 
//        System.out.println("DAO insert sql3->"+sql3);
        //대댓글용
		  String sql4 ="select nvl(max(post_lv),0) from post where post_re = ? and post_restep = ? and post_lv > 0"; 
		  System.out.println("DAO insert sql4->"+sql4);
		 
        try{
        	conn = getConnection();
        	//대댓글
        	if(post_restep !=0) {
        		System.out.println("insert DAO sql4 R U Working??");
        			
        		pstmt = conn.prepareStatement(sql4);
        		pstmt.setInt(1, post.getPost_re());
        		System.out.println("PostDao sql4 Insert getPost_re->" + post.getPost_re());
        		pstmt.setInt(2, post.getPost_restep());
        		System.out.println("PostDao sql4 Insert getPost_restep->" + post.getPost_restep());
        		
        		rs = pstmt.executeQuery();
        		if(rs.next()) {
        			post_lv = rs.getInt(1) + 1;
        			System.out.println("PostDao sql4 Inter getPost_lv->" + post_lv);
        		}
        	
        		pstmt.executeUpdate();
        		pstmt.close();
        		rs.close();
        		
				
//				post.setPost_lv(post.getPost_lv() + 1);
//				System.out.println("PostDao sql4 Insert After getPost_lv->" +
//				post.getPost_lv());
				
        	}
        	//댓글
        	if(post_num != 0) {
        		
        		pstmt = conn.prepareStatement(sql);
        		System.out.println("insert DAO sql R U Working??");
        		pstmt.setInt(1, post_num);
        		rs = pstmt.executeQuery();
        		
        		rs.next();
        		
        		if(post_lv == 0) {
        			post_restep = rs.getInt(1)+1;
        			System.out.println("sql dao if post_Restep ->" + post_restep);
        		}
        		else {
        			post_restep = rs.getInt(1);
        			System.out.println("sql dao else post_Restep ->" + post_restep);
        		}
        		
//        		System.out.println("insert DAO sql3 R U Working??");
//        		pstmt = conn.prepareStatement(sql3);
//        		
//        		pstmt.setInt(1, post.getPost_num());
//        		System.out.println("PostDao sql3 Insert getPost_num->" + post.getPost_num());
//
//        		pstmt.setInt(2, post.getPost_restep());
//        		System.out.println("PostDao sql3 Insert getPost_restep->" + post.getPost_restep());

        		pstmt.executeUpdate();
        		pstmt.close();
        		rs.close();
        		
//        		post.setPost_restep(post.getPost_restep()+1);	
//        		System.out.println("PostDao sql3 Insert After + 1 getPost_restep->" + post.getPost_restep());
        		
        	}
        	
        	pstmt = conn.prepareStatement(sql1);
        	System.out.println("insert DAO sql1 R U Working??");
        	pstmt.setInt(1, post.getBoard_num());
    		System.out.println("PostDao sql1 Insert getBoard_num->" + post.getBoard_num());

        	rs = pstmt.executeQuery();
        	
        	rs.next();
        	
        	int number = rs.getInt(1) + 1;
        	System.out.println("int number = rs.getInt(1)"+number);
        
            rs.close();
            pstmt.close();
           
	           if (post_num == 0) {
	        	   post.setPost_num(number);
	           }
	           post.setPost_num(number);
	           	   
	           pstmt = conn.prepareStatement(sql2);
	           System.out.println("insert DAO sql2 R U Working??");
	           pstmt.setInt(1, post.getBoard_num());
       		   System.out.println("PostDao sql2 Insert getBoard_num->" + post.getBoard_num());

	           pstmt.setInt(2, post.getPost_num());
       		   System.out.println("PostDao sql2 Insert getPost_num()->" + post.getPost_num());
       		
	           pstmt.setString(3, post.getUser_id());
	       	   System.out.println("PostDao sql2 Insert getUser_id()->" + post.getUser_id());

	           pstmt.setString(4, post.getPost_name());
	       	   System.out.println("PostDao sql2 Insert getPost_name()->" + post.getPost_name());

	           pstmt.setString(5, post.getPost_cont());
	       	   System.out.println("PostDao sql2 Insert getPost_cont()->" + post.getPost_cont());
	       	   
	       	   pstmt.setInt(6, post_num);
	       	   System.out.println("PostDao sql2 Insert getPost_re()->" + post_num);
	       	   
	       	   pstmt.setInt(7, post_restep);
	       	   System.out.println("PostDao sql2 Insert post_restep->" + post_restep);
	       	   
	       	   pstmt.setInt(8, post_lv);
	       	   System.out.println("PostDao sql2 Insert post_lv->" + post_lv);
	       	  
	           result = pstmt.executeUpdate();
	        } catch (Exception e) {
	           System.out.println(e.getMessage());
	           
	        } finally {
	           if(rs != null)
	        	   rs.close();
	           if (pstmt != null)
	              pstmt.close();
	           if (conn != null)
	              conn.close();
	        }
	        return result;
     } 
	   
	   
	 //첨부파일 작성
		public int uploadInsert (Upload upload) throws SQLException {
			int result = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			 int post_num = upload.getPost_num();
			System.out.println("postDAO uploadInsert post_Num->" + upload.getPost_num());
				
			String sql = "select nvl(max(post_num),0) from post where board_num = ?";
			String sql1 = "insert into upload_file values(?,?,?,?,TO_CHAR(sysdate,'YYYYMMDD'),?)";
	        System.out.println("PostDao uploadInsert sql->" + sql);
	        System.out.println("PostDao uploadInsert sql1->" + sql1);
			try {
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, upload.getBoard_num());
	        	
	        	rs = pstmt.executeQuery();
	        	
	        	rs.next();
	        	
	        	int number = rs.getInt(1);
	        	System.out.println("number ->" + number);
	        
	            rs.close();
	            pstmt.close();
	            
	            if (post_num == 0)
		        	   upload.setPost_num(number);
	            
	            pstmt = conn.prepareStatement(sql1);
	            
	            pstmt.setInt(1, upload.getBoard_num());
	            System.out.println("PostDao uploadInsert getBoard_num->" + upload.getBoard_num());
		        pstmt.setInt(2, upload.getPost_num());
		        System.out.println("PostDao uploadInsert getPost_num->" + upload.getPost_num());
	            pstmt.setInt(3, upload.getPost_code());
	            System.out.println("PostDao uploadInsert getPost_code->" + upload.getPost_code());
	            pstmt.setString(4, upload.getFile_name());
	            System.out.println("PostDao uploadInsert getFile_name->" + upload.getFile_name());
	            pstmt.setString(5, upload.getFile_name());
	            System.out.println("PostDao uploadInsert getFile_name->" + upload.getFile_name());
	            
				result =  pstmt.executeUpdate();
		        System.out.println("PostDao uploadInsert result->" + result);
			} catch (Exception e) {
				System.out.println("PostDao Exception->"+e.getMessage());
			}finally {
				if(rs != null) rs.close();
				if (pstmt != null)	pstmt.close();
				if (conn != null)	conn.close();
			}
			return result;
		}
		
//		//첨부파일 선택
//		public Upload select() throws SQLException {
//			ResultSet rs = null;
//			Statement stmt = null;
//			Connection conn = null;
//			
//			String sql = "SELECT * FROM upload"; 
//			//System.out.println("DAO select  sql->"+sql);
//			
//			
//			Upload upload = new Upload();
//			try {
//				conn = getConnection();
//				stmt = conn.createStatement();
//				rs = stmt.executeQuery(sql);
//				
//				if (rs.next()) {				
//					upload.setFile_name(rs.getString("file_name"));
//					upload.setBoard_num(rs.getInt("board_num"));
//					upload.setPost_code(rs.getInt("post_code"));
//					upload.setPost_date(rs.getString("post_date"));
//					upload.setPost_num(rs.getInt("post_num"));
//					upload.setFile_realname(rs.getString("file_realname"));
//				}
//			} catch (Exception e) {
//				System.out.println(e.getMessage());
//			} finally {
//				if (rs != null) rs.close();
//				if (stmt != null) stmt.close();
//				if (conn != null) conn.close();
//			}
//			return upload;
//		}
			
			// 첨부파일 삭제
			public int uploadDelete(int board_num, int post_num) throws SQLException {
				Connection conn =null;
			    PreparedStatement pstmt = null;
			      
			    int result_upload = 0;
			      
			    String sql = "delete from upload_file where board_num=? and post_num=?";
			    try {
			    	conn=getConnection();
			         
			        System.out.println("Delete Conn Start...");
			         
			        pstmt = conn.prepareStatement(sql);
			        pstmt.setInt(1, board_num);
			         pstmt.setInt(2, post_num);
			         
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
			
			public Upload select(String file_name, int board_num, int post_num) throws SQLException {
				ResultSet rs = null;
				Statement stmt = null;
				Connection conn = null;
				
				String sql = "SELECT * FROM post join upload_file on(post.board_num = upload_file.board_num and post.post_num=upload_file.post_num)  WHERE post.board_num="+board_num +"and post.post_num="+post_num;
				//System.out.println("DAO select  sql->"+sql);
				
				Post post = new Post();
				Upload upload = new Upload();
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
						upload.setFile_name(rs.getString("file_name"));
						upload.setBoard_num(rs.getInt("board_num"));
						upload.setPost_code(rs.getInt("post_code"));
						upload.setPost_date(rs.getString("post_date"));
						upload.setPost_num(rs.getInt("post_num"));
						upload.setFile_realname(rs.getString("file_realname"));
					}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				} finally {
					if (rs != null) rs.close();
					if (stmt != null) stmt.close();
					if (conn != null) conn.close();
				}
				return upload;
			}
			
			
}




