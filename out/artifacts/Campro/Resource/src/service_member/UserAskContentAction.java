package service_member;

import dao.Post;
import dao.PostDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserAskContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int board_num = Integer.parseInt(request.getParameter("board_num")); 
			int post_num = Integer.parseInt(request.getParameter("post_num"));
			String pageNum = request.getParameter("pageNum");
			String user_id = request.getParameter("user_id");
			//String file_name = request.getParameter("file_name");
			System.out.println("UserAskContentAction board_num->"+board_num);
			System.out.println("UserAskContentAction post_num->"+post_num);
			System.out.println("UserAskContentAction user_id->"+user_id);
			//System.out.println("PostContentAction file_name->"+file_name);
			
			PostDao pd = PostDao.getInstance();
			//UploadDao ud = UploadDao.getInstance();
			
			System.out.println("PostContentAction readcount start");
			//조회수 증가 --> ReadCount
			pd.readCount(board_num, post_num);
			
			//String file_name = u
			
			Post post = pd.select(board_num, post_num);
			//Upload upload = ud.select(file_name, board_num, post_num);
			
			request.setAttribute("post", post);
			request.setAttribute("board_num", board_num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("post_num", post_num);
			request.setAttribute("user_id", user_id);
			//equest.setAttribute("upload", upload);
		} 
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "userAskContent.jsp";
	}

}
