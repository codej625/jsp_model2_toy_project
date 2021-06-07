package service_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.PostDao;

public class UserAskWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			MemberDao md = MemberDao.getInstance();
			PostDao pd = PostDao.getInstance();
			
			String user_id = request.getParameter("user_id");
			
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			int post_num = pd.getPostNum(board_num);
			
			request.setAttribute("user_id", user_id);
			request.setAttribute("post_num",post_num);
			request.setAttribute("board_num", board_num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "userAskWriteForm.jsp";
	}

}
