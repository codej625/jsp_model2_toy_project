package service_post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service_member.CommandProcess;

public class PostDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Post Delete Form Action Start...");
		try {
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			int post_num = Integer.parseInt(request.getParameter("post_num"));
			String pageNum = request.getParameter("pageNum");
			
			System.out.println("DeleteFormAction board_num" + board_num);
			System.out.println("DeleteeFormAction post_num" + post_num);
			
			request.setAttribute("board_num",board_num);
			request.setAttribute("post_num", post_num);
			request.setAttribute("pageNum", pageNum);
		} 
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		System.out.println("PostDeleteFormAction END");
		return "post/postDeleteForm.jsp";
	}

}
