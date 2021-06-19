package service_post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Post;
import dao.PostDao;
import service_member.CommandProcess;



public class PostUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try { 
			request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	//세션아이디로 사용?String user_id = request.getParameter("user_id"); 
	        
	        
	        Post post = new Post();
	        post.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
			post.setPost_num(Integer.parseInt(request.getParameter("post_num")));
	        post.setUser_id(request.getParameter("user_id"));
	        post.setPost_name(request.getParameter("post_name"));
			post.setPost_cont(request.getParameter("post_cont"));
			
			
			PostDao pd = PostDao.getInstance();

			int result = pd.update(post);
		
		
			request.setAttribute("result", result);
			request.setAttribute("board_num",post.getBoard_num());
			request.setAttribute("pageNum", pageNum);
		} 
		catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "/post/postUpdatePro.jsp";	
	}

}
