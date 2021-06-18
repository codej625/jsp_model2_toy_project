package service_post;

import dao.PostDao;
import service_member.CommandProcess;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PostWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("WriteFormAction Start...");
		try {
			PostDao pd = PostDao.getInstance();
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			String pageNum = request.getParameter("pageNum");
			int post_num = pd.getPostNum(board_num);
			
			System.out.println("WriteFormAction board_num" + board_num);
			System.out.println("WriteFormAction pageNum" + pageNum);
			System.out.println("WriteFormAction post_num" + post_num);
			
			request.setAttribute("board_num",board_num);
			request.setAttribute("post_num", post_num);
			request.setAttribute("pageNum", pageNum);
		} 
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "post/postWriteForm.jsp";
	}

}
