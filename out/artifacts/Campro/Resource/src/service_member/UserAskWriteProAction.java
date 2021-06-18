package service_member;

import dao.Post;
import dao.PostDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserAskWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("UserAskProAction start..");
			request.setCharacterEncoding("utf-8");
			
			String pageNum = request.getParameter("pageNum");
			
			PostDao pd = PostDao.getInstance();
			Post post = new Post();
			
			post.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
			System.out.println("UserAskProAction board_num->"+request.getParameter("board_num"));
			post.setPost_num(Integer.parseInt(request.getParameter("post_num")));
			System.out.println("UserAskProAction post_num->"+Integer.parseInt(request.getParameter("post_num")));
			post.setUser_id(request.getParameter("user_id"));
			System.out.println("UserAskProAction user_id->"+request.getParameter("user_id"));
			post.setPost_name(request.getParameter("post_name"));
			System.out.println("UserAskProAction post_name->"+request.getParameter("post_name"));
			post.setPost_cont(request.getParameter("post_cont"));
			System.out.println("UserAskProAction post_cont->"+request.getParameter("post_cont"));
			post.setPost_re(Integer.parseInt(request.getParameter("post_re")));
			System.out.println("UserAskProAction post_re-->"+request.getParameter("post_re"));
			post.setPost_restep(Integer.parseInt(request.getParameter("post_restep")));
			System.out.println("UserAskProAction post_restep-->"+request.getParameter("post_restep"));
			post.setPost_lv(Integer.parseInt(request.getParameter("post_lv")));
			System.out.println("UserAskProAction post_lv-->"+request.getParameter("post_lv"));
			
			int result = pd.insert(post);
			System.out.println("UserAskProAction result->"+result);

			request.setAttribute("result", result);

		} catch (Exception e) {
			System.out.println("UserAskProAction Exception->"+e.getMessage());
		}
		return "userAskWritePro.jsp";
	}

}
