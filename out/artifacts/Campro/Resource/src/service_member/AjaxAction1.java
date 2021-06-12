package service_member;

import dao.Member;
import dao.MemberDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AjaxAction1 implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
	        request.setCharacterEncoding("utf-8"); 
			response.setContentType("text/html;charset=utf-8");
	        // 본인 필요 DB Text가져 옴 (DAO 연결)
	    	String user_id = request.getParameter("user_id");
	    	MemberDao md = MemberDao.getInstance();
			Member member = md.select(user_id);
			
			//System.out.println("board.getWriter()->"+board.getWriter());
			request.setAttribute("user_id",member.getUser_id());

		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
			}
		//request.setAttribute("retStr", "retStr");
       return "ajax1";
	}
}
