package service_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MemberDao;

public class UserDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			String user_id = session.getAttribute("sessionID").toString();
			String user_pw = request.getParameter("user_pw");
			System.out.println("UserDeleteProAction user_pw->"+user_pw);
			
			MemberDao md = MemberDao.getInstance();
			int result = md.delete(user_id,user_pw);
			
			session.setAttribute("sessionID", null);
			session.invalidate();
			
			request.setAttribute("result",result);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "userDeletePro.jsp";
	}

}
