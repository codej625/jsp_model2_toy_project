package service_member;

import dao.MemberDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FindUserPwProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String user_id = request.getParameter("user_id");
			String user_email = request.getParameter("user_email");
			
			MemberDao md = MemberDao.getInstance();
			int result = md.findPw(user_id, user_email);
			request.setAttribute("result",result);
			System.out.println("FindUserPw user_name->"+user_id);
			System.out.println("FindUserPw user_email->"+user_email);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "findUserPwPro.jsp";
	}

}
