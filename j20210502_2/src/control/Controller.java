package control;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service_member.CommandProcess;

/**
 * Servlet implementation class Controller
 */
// @WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<String, Object>();

	public Controller() {
		super();
	}

	public void init(ServletConfig config1) throws ServletException {
		// web.xml에서 propertyConfig에 해당하는 init-param 의 값을 읽어옴
		String props = config1.getInitParameter("config");
		//System.out.println("props->" + props);
		// 명령어와 처리클래스의 매핑정보를 저장할 Properties객체 생성
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			String configFilePath = config1.getServletContext().getRealPath(props);
			f = new FileInputStream(configFilePath);
			//System.out.println("configFilePath->" + configFilePath);
			// command.properties파일의 정보를 Properties객체에 저장
			pr.load(f);
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
				}
		}
		// Iterator객체는 Enumeration객체를 확장시킨 개념의 객체
		Iterator keyIter = pr.keySet().iterator();
		// 객체를 하나씩 꺼내서 그 객체명으로 Properties객체에 저장된 객체에 접근
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next(); // /list.do /writeForm.do
			String className = pr.getProperty(command); // service.ListAction service.ListAction
			//System.out.println("command->" + command);
			//System.out.println("className->" + className);
			try {
				Class<?> commandClass = Class.forName(className);// 해당 문자열을 클래스로 만든다.
				Object commandInstance = commandClass.getDeclaredConstructor().newInstance();
				commandMap.put(command, commandInstance); // Map객체인 commandMap에 객체 저장
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("dd");
		requestPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	private void requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String view = null;
		CommandProcess com = null;
		String command = request.getRequestURI();
		try {
			//System.out.println("requestPro command1->" + command); // /och16/list.do
			command = command.substring(request.getContextPath().length());
			//System.out.println("requestPro command2->" + command); // /och16/list.do
			// }
			com = (CommandProcess) commandMap.get(command);
			//System.out.println("command=> " + command); // /ch16/com
			//System.out.println("com=> " + com); // /ch16/com
			view = com.requestPro(request, response);
			//System.out.println("view=> " + view); // /ch16/com
		} catch (Throwable e) {
			throw new ServletException(e);
		}
//		Ajax String를 포함하고 있으면
		if (command.contains("ajaxTest1")) {
			//System.out.println("ajaxTest1 String->" + command); // /ch16/list.do
//			text 있다면
			String writer = (String) request.getAttribute("writer");
			//System.out.println("Controller writer->" + writer);
			PrintWriter pw = response.getWriter();
			pw.write(writer);
			// flush-> 버퍼있는걸 다올려라
			pw.flush();

		} else { // 일반적인경우
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}
}
