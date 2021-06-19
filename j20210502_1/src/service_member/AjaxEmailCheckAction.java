package service_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class AjaxEmailCheckAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String user_email = request.getParameter("user_email");
			String emailCheck = "";
			MemberDao md = MemberDao.getInstance();
			Member member = md.selectEmail(user_email);
			if (member.getUser_email() == null) {
				emailCheck = "사용가능한 이메일입니다.";
			} else {
				emailCheck = "이미 존재하는이메일입니다! 다시입력하세요.";
			}
			System.out.println("emailCheck->" + emailCheck);
			System.out.println("user_email->" + user_email);
			request.setAttribute("emailCheck", emailCheck);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "AjaxEmailCheck";
	}

}
