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
	         
	        System.out.println("DeletePostProAction post_num->" + post_num);
	        PostDao pd = PostDao.getInstance();
	        pd.uploadDelete(post_num, board_num);
	        int result = pd.postDelete(post_num, board_num);
	         
	        request.setAttribute("result", result);
	        
	        System.out.println("Delete Post Pro Action Result->" + result);
	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	    }
	    return "post/postDeletePro.jsp";
	}
}
