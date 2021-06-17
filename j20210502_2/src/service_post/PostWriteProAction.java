package service_post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Post;
import dao.PostDao;
import service_member.CommandProcess;

public class PostWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("PostWriteProAction Start...");
	        request.setCharacterEncoding("utf-8");
	        
	        int post_num = Integer.parseInt(request.getParameter("post_num"));
	        System.out.println("What is Post_num1?? " + post_num);
	        
	        if(post_num == 0) post_num = 1;
	        else if(post_num != 0) post_num += 1;
	        System.out.println("What is Post_num2?? " + post_num);
	        
	        Post post = new Post();
	        
			post.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
			System.out.println("PostWritePro board_num-->"+request.getParameter("board_num"));
			post.setPost_num(Integer.parseInt(request.getParameter("post_num")));
			System.out.println("PostWritePro post_num-->"+request.getParameter("post_num"));
	        post.setUser_id(request.getParameter("user_id"));
	        System.out.println("PostWritePro user_id-->"+request.getParameter("user_id"));
	        post.setPost_name(request.getParameter("post_name"));
			post.setPost_cont(request.getParameter("post_cont"));
				
	        PostDao pd = PostDao.getInstance();//DB 
	        
	        int result = pd.insert(post);
	        System.out.println("WriteProAction result-->" + result);
	        
	        request.setAttribute("result", result);
	        
		} catch(Exception e) { 
			System.out.println(e.getMessage()); }
      
		return "post/postWritePro.jsp";
	}

}
