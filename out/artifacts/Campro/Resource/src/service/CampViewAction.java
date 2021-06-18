package service;

import dao.Camp_InfoDao;
import dto.Camp_InfoDto;
import service_member.CommandProcess;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CampViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Camp_InfoDao dao = Camp_InfoDao.getInstance();
		try {
			request.setCharacterEncoding("utf-8");
			int camp_Id = Integer.parseInt(request.getParameter("camp_Id"));
			Camp_InfoDto Camp_InfoDto = dao.view(camp_Id);
			request.setAttribute("Camp_InfoDto", Camp_InfoDto);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "campView.jsp";
	}
}
