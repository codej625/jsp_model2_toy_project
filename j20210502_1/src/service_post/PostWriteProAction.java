<<<<<<< HEAD
package service_post;
import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Post;
import dao.PostDao;
import dao.Upload;
import service_member.CommandProcess;

public class PostWriteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----------------------------------------------");
		try {
			System.out.println("PostWriteProAction Start...");
			String savFilename1 = "";
		//	String savFilename2 = "";
		    int post_code = 0; 
			request.setCharacterEncoding("utf-8");
			int maxSize = 5 * 1024 * 1024;
			String fileSave = "/upload"; // 절대경로
	        String pageNum = request.getParameter("pageNum");

			PostDao pd = PostDao.getInstance();//DB
			Upload upload = new Upload();
			
			String realPath = request.getServletContext().getRealPath(fileSave);
			System.out.println("realPath->" + realPath);
			
			MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			
			Post post = new Post();
			
			post.setBoard_num(Integer.parseInt(multi.getParameter("board_num")));
			System.out.println("post.board_num ->" + multi.getParameter("board_num"));
			post.setPost_num(Integer.parseInt(multi.getParameter("post_num")));
			System.out.println("post.post_num ->" + multi.getParameter("post_num"));
			post.setUser_id(multi.getParameter("user_id"));
			System.out.println("post.user_id ->" + multi.getParameter("user_id"));
			post.setPost_name(multi.getParameter("post_name"));
			System.out.println("post.post_name ->" + multi.getParameter("post_name"));
			post.setPost_cont(multi.getParameter("post_cont"));
			System.out.println("post.post_cont ->" + multi.getParameter("post_cont"));
			post.setPost_re(Integer.parseInt(multi.getParameter("post_re")));
			System.out.println("post.post_re ->" + multi.getParameter("post_re"));
			post.setPost_restep(Integer.parseInt(multi.getParameter("post_restep")));
			System.out.println("post.post_restep ->" + multi.getParameter("post_restep"));
			post.setPost_lv(Integer.parseInt(multi.getParameter("post_lv")));
			System.out.println("post.post_lv ->" + multi.getParameter("post_lv"));


//          post.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
//	        post.setUser_id(request.getParameter("user_id"));
//	        post.setPost_date(request.getParameter("post_date"));
//	        post.setPost_name(request.getParameter("post_name"));
//			post.setPost_cont(request.getParameter("post_cont"));
	
	        int result = pd.insert(post);
	    
	    	upload.setBoard_num(Integer.parseInt(multi.getParameter("board_num")));
	    	System.out.println("After pd.insert board-num -> " + multi.getParameter("board_num"));
	    	upload.setPost_num(Integer.parseInt(multi.getParameter("post_num")));
	    	System.out.println("After pd.insert post-num -> " + multi.getParameter("post_num"));
	    	
		    Enumeration en = multi.getFileNames();
		     
		         while (en.hasMoreElements()) {
		        	 System.out.println("while R U Working???");
		        // input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
		        //	String[] filename1 =null;
		        //	filename1 = new String[i];
		            String filename1 = (String) en.nextElement();
		            System.out.println("filename1 -> " + filename1);
		            // 서버에 저장된 파일 이름
		            savFilename1 = multi.getFilesystemName(filename1);
		         	System.out.println("saveFilename1 ->" + savFilename1);       
		            // 전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일객체생성
		            File file = multi.getFile(filename1);
		            System.out.println("File -> " + file);
		            if (file != null) {
		               System.out.println("if file working????");
		               result = 0;
		               
		               upload.setFile_name(savFilename1);
		               result = pd.uploadInsert(upload);
		               System.out.println("if -- result -> " + result);
		            }
		         }

	        request.setAttribute("board_num",post.getBoard_num());
	        request.setAttribute("post_num", post.getPost_num());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
	        
			
	        System.out.println("PostWriteFormAction board_num ->" +post.getBoard_num());
	        System.out.println("PostWriteFormAction post_num ->" +post.getPost_num());
	        System.out.println("PostWriteFormAction upload-board_num->" + upload.getBoard_num());
	        System.out.println("PostWriteFormAction upload-post_num->" + upload.getPost_num());
			System.out.println("PostWriteFormAction pageNum ->" +pageNum);
			System.out.println("PostWriteFormAction result ->" +result);
		} 
		catch(Exception e) { 
			System.out.println(e.getMessage()); 
			}
		return "/post/postWritePro.jsp";
	}
}
=======
package service_post;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Post;
import dao.PostDao;
import dao.Upload;
import service_member.CommandProcess;

public class PostWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("PostWriteProAction Start...");
	        request.setCharacterEncoding("utf-8");
	        String savFilename1 = "";
	        
	        request.setCharacterEncoding("utf-8");
			int maxSize = 5 * 1024 * 1024;
			String fileSave = "/upload"; // 절대경로
	        String pageNum = request.getParameter("pageNum");

	        PostDao pd = PostDao.getInstance();//DB
	        Upload upload = new Upload();
	        
	        String realPath = request.getServletContext().getRealPath(fileSave);
			System.out.println("realPath->" + realPath);
			
			MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
	        
			Post post = new Post();
			
			post.setBoard_num(Integer.parseInt(multi.getParameter("board_num")));
			System.out.println("post.board_num ->" + multi.getParameter("board_num"));
			post.setPost_num(Integer.parseInt(multi.getParameter("post_num")));
			System.out.println("post.post_num ->" + multi.getParameter("post_num"));
			post.setUser_id(multi.getParameter("user_id"));
			System.out.println("post.user_id ->" + multi.getParameter("user_id"));
			post.setPost_name(multi.getParameter("post_name"));
			System.out.println("post.post_name ->" + multi.getParameter("post_name"));
			post.setPost_cont(multi.getParameter("post_cont"));
			System.out.println("post.post_cont ->" + multi.getParameter("post_cont"));
			post.setPost_re(Integer.parseInt(multi.getParameter("post_re")));
			System.out.println("post.post_re ->" + multi.getParameter("post_re"));
			post.setPost_restep(Integer.parseInt(multi.getParameter("post_restep")));
			System.out.println("post.post_restep ->" + multi.getParameter("post_restep"));
			post.setPost_lv(Integer.parseInt(multi.getParameter("post_lv")));
			System.out.println("post.post_lv ->" + multi.getParameter("post_lv"));
			
	        int result = pd.insert(post);
	        System.out.println("WriteProAction result-->" + result);
	        
	        upload.setBoard_num(Integer.parseInt(multi.getParameter("board_num")));
	    	System.out.println("After pd.insert board-num -> " + multi.getParameter("board_num"));
	    	upload.setPost_num(Integer.parseInt(multi.getParameter("post_num")));
	    	System.out.println("After pd.insert post-num -> " + multi.getParameter("post_num"));
	        
	    	Enumeration en = multi.getFileNames();
		     
	         while (en.hasMoreElements()) {
	        	 System.out.println("while R U Working???");
	        // input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
	        //	String[] filename1 =null;
	        //	filename1 = new String[i];
	            String filename1 = (String) en.nextElement();
	            System.out.println("filename1 -> " + filename1);
	            // 서버에 저장된 파일 이름
	            savFilename1 = multi.getFilesystemName(filename1);
	         	System.out.println("saveFilename1 ->" + savFilename1);       
	            // 전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일객체생성
	            File file = multi.getFile(filename1);
	            System.out.println("File -> " + file);
	            if (file != null) {
	               System.out.println("if file working????");
	               result = 0;
	               
	               upload.setFile_name(savFilename1);
	               result = pd.uploadInsert(upload);
	               System.out.println("if -- result -> " + result);
	            }
	         }
	        request.setAttribute("board_num",post.getBoard_num());
		    request.setAttribute("result", result);
		    request.setAttribute("pageNum", pageNum);  
		} 
		catch(Exception e) { 
			System.out.println(e.getMessage()); }
      
		return "post/postWritePro.jsp";
	}

}
>>>>>>> 02_team
