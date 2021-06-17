package service_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class UserLoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			
			MemberDao md = MemberDao.getInstance();
			int result = md.check(user_id,user_pw);
			int user_code = md.ChkUserCode(user_id);
			
			request.setAttribute("result",result);
			request.setAttribute("user_code",user_code);
			if(result>0) {
				request.getSession().setAttribute("sessionID", user_id);
				request.getSession().setAttribute("sessionCODE", user_code);
				System.out.println("Login user_code->" + user_code);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "userLoginPro.jsp";
	}

}
