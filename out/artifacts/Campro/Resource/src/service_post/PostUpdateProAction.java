package service_post;

import dao.Post;
import dao.PostDao;
import service_member.CommandProcess;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PostUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try { 
			request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        String user_id = request.getParameter("user_id");
	        
	        
	        Post post = new Post();
	        post.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
			post.setPost_num(Integer.parseInt(request.getParameter("post_num")));
	        post.setUser_id(request.getParameter("user_id"));
	        post.setPost_name(request.getParameter("post_name"));
			post.setPost_cont(request.getParameter("post_cont"));
			
			
			PostDao pd = PostDao.getInstance();

			int result = pd.update(post);
		
		
			request.setAttribute("result", result);
			request.setAttribute("post_num", post.getPost_num());
			request.setAttribute("pageNum", pageNum);
		} 
		catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "post/postUpdatePro.jsp";	
	}

}
