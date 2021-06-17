package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Camp_InfoDao;
import dto.Camp_InfoDto;
import service_member.CommandProcess;

public class CampUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int camp_Id = Integer.parseInt(request.getParameter("camp_Id"));
		String pageNum = request.getParameter("pageNum");
		Camp_InfoDao bd = Camp_InfoDao.getInstance();
		try {
			Camp_InfoDto camp_InfoDto = bd.select(camp_Id);

			request.setAttribute("camp_InfoDto", camp_InfoDto);
			request.setAttribute("pageNum", pageNum);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "campUpdateForm.jsp";
	}

}
