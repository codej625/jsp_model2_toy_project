package service_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Post;
import dao.PostDao;

public class UserAskWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("UserAskProAction start..");
			request.setCharacterEncoding("utf-8");
			
			int post_num = Integer.parseInt(request.getParameter("post_num"));
			
			if(post_num == 0) { post_num = 1; }
			else if(post_num > 0) { post_num += 1;}
			
			Post post = new Post();
			post.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
			System.out.println("UserAskProAction board_num->"+request.getParameter("board_num"));
			post.setPost_num(post_num);
			System.out.println("UserAskProAction post_num->"+post_num);
			post.setUser_id(request.getParameter("user_id"));
			System.out.println("UserAskProAction user_id->"+request.getParameter("user_id"));
			post.setPost_name(request.getParameter("post_name"));
			System.out.println("UserAskProAction post_name->"+request.getParameter("post_name"));
			post.setPost_cont(request.getParameter("post_cont"));
			System.out.println("UserAskProAction post_cont->"+request.getParameter("post_cont"));
			
			PostDao pd = PostDao.getInstance();

			int result = pd.insert(post);
			System.out.println("UserAskProAction result->"+result);

			request.setAttribute("result", result);

		} catch (Exception e) {
			System.out.println("UserAskProAction Exception->"+e.getMessage());
		}
		return "userAskWritePro.jsp";
	}

}
