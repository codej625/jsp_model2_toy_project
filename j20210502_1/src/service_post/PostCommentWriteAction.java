package service_post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Post;
import dao.PostDao;
import service_member.CommandProcess;

public class PostCommentWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostDao pd = PostDao.getInstance();
		Post post = new Post();
		
		//댓글 내용값을 post_cont로 넣어줌
//		String post_cont = request.getParameter("txt");
//		System.out.println("ssssssspost_cont->"+post_cont);
	
//		System.out.println("comment.txt ->" + post_cont);
		request.setCharacterEncoding("utf-8");
		
		try {
			String pageNum = request.getParameter("pageNum");
			
			post.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
			post.setPost_num(Integer.parseInt(request.getParameter("post_num")));
			post.setUser_id(request.getParameter("user_id"));
			post.setPost_name(request.getParameter("post_name"));
			post.setPost_cont(request.getParameter("txt"));

			
			int result = pd.insert(post);
		
			request.setAttribute("board_num", post.getBoard_num());
			request.setAttribute("post_num", post.getPost_num());
			request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
	        
	        System.out.println("=============================================");
	        System.out.println("PostCommentWriteAction board_num -> " + post.getBoard_num());
	        System.out.println("PostCommentWriteAction post_num -> " + post.getPost_num());
	        System.out.println("PostCommentWriteAction user_id -> " + post.getUser_id());
	        System.out.println("PostCommentWriteAction post_name -> " + post.getPost_name());
	        System.out.println("PostCommentWriteAction post_cont -> " + post.getPost_cont());
	        System.out.println("PostCommentWriteAction post_re -> " + post.getPost_re());
	        System.out.println("PostCommentWriteAction post_restep -> " + post.getPost_restep());
	        System.out.println("PostCommentWriteAction post_lv-> " + post.getPost_lv());
	        
		} 
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "/post/postCommentWritePro.jsp";
	}

}
