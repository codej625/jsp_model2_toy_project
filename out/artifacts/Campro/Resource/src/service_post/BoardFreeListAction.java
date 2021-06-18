package service_post;

import dao.Post;
import dao.PostDao;
import service_member.CommandProcess;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BoardFreeListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
PostDao pd = PostDao.getInstance();
		
		
		try {			
			int board_num = 2;
			System.out.println("Let's start MarketListAction~~");
			int totCnt  = pd.getTotalCnt(board_num);
			String pageNum = request.getParameter("pageNum");
			
			if (pageNum==null || pageNum.equals("")) {	
				pageNum = "1";	
				}
			
			int currentPage = Integer.parseInt(pageNum);	
			int pageSize  = 10, blockSize = 10;
			// page = 2 -->  startRow = 11 , endRow = 20
			// page = 3 -->  startRow = 21 , endRow = 30
			int startRow = (currentPage - 1) * pageSize + 1;  // start -> 1
			int endRow   = startRow + pageSize - 1;           // start -> 10
			int startNum = totCnt - startRow + 1;             //21 - 1 = 20
			
			System.out.println("startRow-->" + startRow);
			System.out.println("endRow-->" + endRow);
			System.out.println("startNum-->" + startNum);
			
			List<Post> list = pd.list(startRow, endRow, board_num);	
			int post_num = pd.getPostNum(board_num);
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize); //21/10
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize -1;	
			if (endPage > pageCnt) 
				endPage = pageCnt;	
			
			request.setAttribute("board_num", board_num);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("post_num", post_num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			 
			System.out.println("-----------------------------------------------");  // /ch16/list.do
			System.out.println("Board Num -->" + board_num);
			System.out.println("post_num-->" + post_num);
			System.out.println("pageNum-->" + pageNum);
			System.out.println("startNum-->" + startNum);  // /ch16/list.do
			System.out.println("totCnt-->" + totCnt);  // /ch16/list.do
			System.out.println("currentPage-->" + currentPage);  // /ch16/list.do
			System.out.println("blockSize-->" + blockSize);  // /ch16/list.do
			System.out.println("pageSize-->" + pageSize);  // /ch16/list.do
			System.out.println("pageCnt-->" + pageCnt);  // /ch16/list.do
			System.out.println("startPage-->" + startPage);  // /ch16/list.do
			System.out.println("endPage-->" + endPage);  // /ch16/list.do
		} 
		catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "/post/boardFreeForm.jsp";
	}

}
