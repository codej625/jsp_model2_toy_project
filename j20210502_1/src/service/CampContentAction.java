package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Camp_InfoDao;
import dto.Camp_InfoDto;
import service_member.CommandProcess;

public class CampContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int camp_Id = Integer.parseInt(request.getParameter("camp_Id"));
			String pageNum = request.getParameter("pageNum");
			Camp_InfoDao bd = Camp_InfoDao.getInstance();
			Camp_InfoDto camp_InfoDto = bd.select(camp_Id);

			request.setAttribute("camp_Id", camp_Id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("camp_InfoDto", camp_InfoDto);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "campContent.jsp";
	}

}
