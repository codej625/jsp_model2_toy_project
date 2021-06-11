package service_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.Post;
import dao.PostDao;

public class UserAskWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
request.setCharacterEncoding("utf-8");
			
			String user_id = request.getParameter("user_id");
			int post_num = 0, post_re = 0, post_restep = 0, post_lv = 0;
			int board_num = 3;
			String pageNum = request.getParameter("pageNum");
    		if (pageNum == null) pageNum = "1";
    		// 답글용도
    		if(request.getParameter("post_num") != null) {
    			post_num = Integer.parseInt(request.getParameter("post_num"));
    			PostDao pd = PostDao.getInstance();
    			Post post = pd.select(board_num, post_num);
    			post_re = post.getPost_re();
    			System.out.println("WriteFormAction post_re-->" + post_re);
    			post_restep = post.getPost_restep();
    			post_lv = post.getPost_lv();
    		}
    		request.setAttribute("user_id", user_id);
    		System.out.println("WriteFormAction user_id-->" + user_id);
    		request.setAttribute("board_num", board_num);
    		System.out.println("WriteFormAction board-->" + board_num);
    		request.setAttribute("post_num", post_num);
    		System.out.println("WriteFormAction post_num-->" + post_num);
			request.setAttribute("post_re", post_re);
			System.out.println("WriteFormAction post_re-->" + post_re);
			request.setAttribute("post_lv", post_lv);
			request.setAttribute("post_restep", post_restep);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "userAskWriteForm.jsp";
	}

}
