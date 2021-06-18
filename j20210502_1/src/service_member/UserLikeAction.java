package service_member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FavoriteCamp;
import dao.FavoriteCampDao;

public class UserLikeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String user_id = request.getParameter("user_id");
			FavoriteCampDao fcd = FavoriteCampDao.getInstance();
//			FavoriteCamp favoritecamp = fcd.select(user_id);
			List<FavoriteCamp> list = fcd.list(user_id);
			request.setAttribute("list", list);
//			System.out.println("123123 ::: " + list.size());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "userLike.jsp";
	}

}
