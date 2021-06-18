package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Camp_InfoDao;
import service_member.CommandProcess;

public class CampDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int camp_Id = Integer.parseInt(request.getParameter("camp_Id"));
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			Camp_InfoDao bd = Camp_InfoDao.getInstance();
			int result = bd.delete(camp_Id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("camp_Id", camp_Id);
			request.setAttribute("result", result);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "campDeletePro.jsp";
	}

}

