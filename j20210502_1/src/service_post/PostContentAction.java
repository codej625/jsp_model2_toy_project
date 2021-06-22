<<<<<<< HEAD
package service_post;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Post;
import dao.PostDao;
import dao.Upload;
import service_member.CommandProcess;

public class PostContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		try {
			int board_num = Integer.parseInt(request.getParameter("board_num")); 
			int post_num = Integer.parseInt(request.getParameter("post_num")); 
			String file_name = request.getParameter("file_name");
			String pageNum = request.getParameter("pageNum");
			
			System.out.println("PostContentAction board_num->"+board_num);
			System.out.println("PostContentAction post_num->"+post_num);
			System.out.println("PostContentAction pageNum->" + pageNum);
//			System.out.println("PostContentAction file_name ->"+file_name);
			
			PostDao pd = PostDao.getInstance();
			
			int totCnt  = pd.getTotalCnt(board_num);
			
			//조회수 증가 --> ReadCount
			pd.readCount(board_num, post_num);
			
			Post post = pd.select(board_num, post_num);
			Upload upload = pd.select(file_name, board_num, post_num);
			
			//댓글 리스트
			List<Post> comment_list = pd.comment_list(board_num, post_num);	
	
			request.setAttribute("post", post);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("board_num", board_num);
	        request.setAttribute("post_num", post_num);
			request.setAttribute("comment_list", comment_list);
			request.setAttribute("upload",upload);
		
//			request.setAttribute("post_num", post_num);
//			request.setAttribute("post_name", post.getPost_name());
//			request.setAttribute("post_num", post_num);
//			request.setAttribute("post_num", post_num);
//			request.setAttribute("post_num", post_num);
			request.setAttribute("pageNum", pageNum);
	
			
//			System.out.println("PostContentAction board_num->"+board_num);
//			System.out.println("PostContentAction post_num->"+post_num);
//			System.out.println("PostContentAction post->" +post);
			System.out.println("PostContentAction pageNum->"+pageNum);
//			System.out.println("PostContentAction upload ->"+upload);
		} 
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "/post/postContent.jsp";
	}

}
=======
package service_post;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Post;
import dao.PostDao;
import dao.Upload;
import service_member.CommandProcess;

public class PostContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int board_num = Integer.parseInt(request.getParameter("board_num")); 
			int post_num = Integer.parseInt(request.getParameter("post_num")); 
			String file_name = request.getParameter("fiel_name");
			String pageNum = request.getParameter("pageNum");
			
			System.out.println("PostContentAction board_num->"+board_num);
			System.out.println("PostContentAction post_num->"+post_num);
			System.out.println("PostContentAction pageNum->" + pageNum);
			
			PostDao pd = PostDao.getInstance();
			
			int totCnt  = pd.getTotalCnt(board_num);
			//조회수 증가 --> ReadCount
			pd.readCount(board_num, post_num);
			
			Post post = pd.select(board_num, post_num);
			Upload upload = pd.select(file_name,  board_num, post_num);
			//댓글 리스트
			List<Post> comment_list = pd.comment_list(board_num, post_num);
			
			
			request.setAttribute("post", post);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("board_num", board_num);
			request.setAttribute("post_num", post_num);
			request.setAttribute("comment_list", comment_list);
			request.setAttribute("upload",upload);
			request.setAttribute("pageNum", pageNum);
			
		} 
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "post/postContent.jsp";
	}

}
>>>>>>> 02_team
