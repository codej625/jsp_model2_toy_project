package service_post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostDao;
import service_member.CommandProcess;

public class PostDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("DeletePostProAction Start...");
		try {
			int post_num = Integer.parseInt(request.getParameter("post_num"));
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			String pageNum = request.getParameter("pageNum");
	         
	        System.out.println("DeletePostProAction post_num->" + post_num);
	        PostDao pd = PostDao.getInstance();
	        pd.uploadDelete(board_num, post_num);
	        int result = pd.postDelete(board_num, post_num);
	         
	        request.setAttribute("board_num", board_num);
	        request.setAttribute("post_num", post_num);
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
	        
	         System.out.println("Delete PostPro board_num->" + board_num);
	         System.out.println("Delete PostPro Result->" + result);
	         System.out.println("Delete PostPro post_num->" + post_num);
	         System.out.println("Delete PostPro pageNum->" + pageNum);
	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	    }
	    return "post/postDeletePro.jsp";
	}
}
