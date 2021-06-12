package service_member;

import dao.Member;
import dao.MemberDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			Member member = new Member();
			
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("cur_pw");
			MemberDao md = MemberDao.getInstance();
			int result1 = md.check(user_id,user_pw);
			
			if(result1 > 0) {
				request.getSession().setAttribute("sessionID", user_id);
			} else return "NewFile.jsp";
			
			member.setUser_id(request.getParameter("user_id"));
			member.setUser_pw(request.getParameter("new_pw"));
			member.setUser_name(request.getParameter("user_name"));
			member.setUser_tel(request.getParameter("user_tel"));
			member.setUser_addr(request.getParameter("user_addr"));
			member.setUser_email(request.getParameter("user_email"));
			member.setUser_gender(request.getParameter("user_gender"));
			
			int result = md.update(member);
			
			request.setAttribute("result",result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "userUpdatePro.jsp";
	}

}
