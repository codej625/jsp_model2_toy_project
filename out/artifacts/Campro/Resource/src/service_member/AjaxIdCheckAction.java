package service_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class AjaxIdCheckAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String user_id = request.getParameter("user_id");
			String idCheck = "";
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(user_id);
			if (member.getUser_id() == null) {
				idCheck = "사용가능한 아이디입니다.";
			} else {
				idCheck = "이미 존재하는 아이디입니다! 다시입력하세요.";
			}
			System.out.println("idCheck->" + idCheck);
			System.out.println("user_id->" + user_id);
			request.setAttribute("idCheck", idCheck);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "AjaxIdCheck";
	}

}
