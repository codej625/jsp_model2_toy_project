package service_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class UserJoinProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			System.out.println("UserJoinProAction start....");
			
			Member member = new Member();
			member.setUser_id(request.getParameter("user_id"));
			member.setUser_pw(request.getParameter("user_pw"));
			member.setUser_name(request.getParameter("user_name"));
			member.setUser_tel(request.getParameter("user_tel"));
			member.setUser_addr(request.getParameter("user_addr"));
			member.setUser_email(request.getParameter("user_email"));
			member.setUser_gender(request.getParameter("user_gender"));
			MemberDao md = MemberDao.getInstance();
			
			int result = md.insert(member);
			
			//int id_chk = md.duplication(user_id);
			//request.setAttribute("id_chk", id_chk);
			request.setAttribute("result", result);
			

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "userJoinPro.jsp";
	}

}
