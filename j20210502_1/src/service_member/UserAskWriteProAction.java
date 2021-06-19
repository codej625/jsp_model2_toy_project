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
			request.setCharacterEncoding("utf-8");
			
			String pageNum = request.getParameter("pageNum");
			
			PostDao pd = PostDao.getInstance();
			Post post = new Post();
			
			post.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
			post.setPost_num(Integer.parseInt(request.getParameter("post_num")));
			post.setUser_id(request.getParameter("user_id"));
			post.setPost_name(request.getParameter("post_name"));
			post.setPost_cont(request.getParameter("post_cont"));
			post.setPost_re(Integer.parseInt(request.getParameter("post_re")));
			post.setPost_restep(Integer.parseInt(request.getParameter("post_restep")));
			post.setPost_lv(Integer.parseInt(request.getParameter("post_lv")));
			
			int result = pd.insert(post);

			request.setAttribute("result", result);

		} catch (Exception e) {
			System.out.println("UserAskProAction Exception->"+e.getMessage());
		}
		return "userAskWritePro.jsp";
	}

}
