package service_member;

import dao.MemberDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FindUserIdProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String user_name = request.getParameter("user_name");
			String user_email = request.getParameter("user_email");
			
			MemberDao md = MemberDao.getInstance();
			String user_id = md.findId(user_name, user_email);
			request.setAttribute("user_id",user_id);
			System.out.println("FindUserId user_name->"+user_name);
			System.out.println("FindUserId user_email->"+user_email);
			System.out.println("FindUserId user_id->" + user_id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "findUserIdPro.jsp";
	}

}
