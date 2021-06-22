package service_post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Post;
import dao.PostDao;
import service_member.CommandProcess;

public class PostReCommentWriteAction implements CommandProcess {
  
  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    PostDao pd = PostDao.getInstance();
    Post post = new Post();
    
    request.setCharacterEncoding("utf-8");
    
    try {
      String pageNum = request.getParameter("pageNum");
      
      post.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
      post.setPost_num(Integer.parseInt(request.getParameter("post_num")));
      post.setUser_id(request.getParameter("user_id"));
      post.setPost_name(request.getParameter("post_name"));
      post.setPost_cont(request.getParameter("txt"));
      post.setPost_re(Integer.parseInt(request.getParameter("post_re")));
      post.setPost_restep(Integer.parseInt(request.getParameter("post_restep")));
      
      int result = pd.insert(post);
      
      request.setAttribute("board_num", post.getBoard_num());
      request.setAttribute("post_num", post.getPost_num());
      request.setAttribute("result", result);
      request.setAttribute("pageNum", pageNum);
      
    } catch (Exception e) {
    }
    return "/post/postReCommentWritePro.jsp";
  }
  
}
