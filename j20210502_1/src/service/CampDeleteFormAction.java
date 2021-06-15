<<<<<<< HEAD
package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service_member.CommandProcess;

public class CampDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int camp_Id = Integer.parseInt(request.getParameter("camp_Id"));
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("camp_Id", camp_Id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "campDeleteForm.jsp";
	}

}
=======
package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service_member.CommandProcess;

public class CampDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int camp_Id = Integer.parseInt(request.getParameter("camp_Id"));
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("camp_Id", camp_Id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "campDeleteForm.jsp";
	}

}
>>>>>>> 325354226853041f782988823a95cedfa85c74d3
