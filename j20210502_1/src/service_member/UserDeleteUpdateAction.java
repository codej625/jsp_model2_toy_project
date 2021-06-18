package service_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class UserDeleteUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			
			String user_id = request.getParameter("user_id");
			System.out.println("user_id->"+user_id);
			MemberDao md = MemberDao.getInstance();
			int result = md.deleteUpdate(user_id);
			request.setAttribute("result",result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "userDeleteUpdate.jsp";
	}

}
