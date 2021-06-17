package service_post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Post;
import dao.PostDao;
import service_member.CommandProcess;

public class PostUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			int post_num = Integer.parseInt(request.getParameter("post_num"));
			String pageNum = request.getParameter("pageNum");
			PostDao pd = PostDao.getInstance();
			Post post = pd.select(board_num,post_num);
			
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("post", post);
			System.out.println("setAttribute(\"post\", post)"+post);
		}
		catch(Exception e) {	
			System.out.println(e.getMessage());	}
		return "post/postUpdateForm.jsp";
	}

}
