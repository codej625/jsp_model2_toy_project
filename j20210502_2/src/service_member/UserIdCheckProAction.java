package service_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class UserIdCheckProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String user_id = request.getParameter("user_id");
			
			MemberDao md = MemberDao.getInstance();
			int result = md.IdDupl(user_id);	// 없으면 0, 있으면 1
			request.setAttribute("result",result);
			System.out.println("duplication user_id->"+user_id);
			System.out.println("duplication result->"+result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "idDuplicationCheckPro.jsp";
	}

}
