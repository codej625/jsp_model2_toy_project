package service_post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Post;
import dao.PostDao;
import service_member.CommandProcess;

public class PostContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int board_num = Integer.parseInt(request.getParameter("board_num")); 
			int post_num = Integer.parseInt(request.getParameter("post_num")); 
			System.out.println("PostContentAction board_num->"+board_num);
			System.out.println("PostContentAction post_num->"+post_num);
			PostDao pd = PostDao.getInstance();
			
			//조회수 증가 --> ReadCount
			//pd.readCount(post_num);
			Post post = pd.select(board_num, post_num);
	
			
			request.setAttribute("post", post);
			request.setAttribute("board_num", board_num);
			request.setAttribute("post_num", post_num);
			
		} 
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "post/postContent.jsp";
	}

}
