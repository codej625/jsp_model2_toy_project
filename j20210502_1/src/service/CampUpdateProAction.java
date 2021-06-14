package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Camp_InfoDao;
import dto.Camp_InfoDto;
import service_member.CommandProcess;

public class CampUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			int camp_Id = Integer.parseInt(request.getParameter("camp_Id"));

			Camp_InfoDto camp_InfoDto = new Camp_InfoDto();
			camp_InfoDto.setCamp_Id(Integer.parseInt(request.getParameter("camp_Id")));
			camp_InfoDto.setCamp_Name(request.getParameter("camp_Name"));
			camp_InfoDto.setCamp_Tel(request.getParameter("camp_Tel"));
			camp_InfoDto.setCamp_Addr(request.getParameter("camp_Addr"));
			camp_InfoDto.setCamp_Loc(request.getParameter("camp_Loc"));
			camp_InfoDto.setC_F(Integer.parseInt(request.getParameter("c_F")));
			camp_InfoDto.setRes_Id(request.getParameter("res_Id"));
			camp_InfoDto.setCamp_Desc(request.getParameter("camp_Desc"));
			camp_InfoDto.setCamp_Images(request.getParameter("camp_Images"));
			camp_InfoDto.setCamp_View1(request.getParameter("camp_View1"));
			camp_InfoDto.setCamp_View2(request.getParameter("camp_View2"));
			camp_InfoDto.setCamp_View3(request.getParameter("camp_View3"));
			camp_InfoDto.setCamp_Item(request.getParameter("camp_Item"));

			Camp_InfoDao bd = Camp_InfoDao.getInstance();
			int result = bd.update(camp_InfoDto);
			request.setAttribute("result", result);
			request.setAttribute("camp_Id", camp_Id);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "campUpdatePro.jsp";
	}

}
