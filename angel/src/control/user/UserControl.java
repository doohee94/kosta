package control.user;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.*;
import command.user.*;


/**
 * Servlet implementation class UserControl
 */
@WebServlet("/UserControl")
public class UserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap commandMap;
	private String	jspDir = "/login/";
	private String error = "/main/error.jsp";
	
	
    public UserControl() {
        super();
        System.out.println("여길 타긴하나.....");
        initCommand();
    }

	private void initCommand() {
		System.out.println("여기도 타야함.......제발");
		commandMap = new HashMap();
		commandMap.put("loginCheck", new CommandLogin("main.jsp"));

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		
		System.out.println();
		
		
		String nextPage = "";
		String cmdKey	= request.getParameter("cmd"); //list-page
	
		if( cmdKey == null ){
			cmdKey = "main-page";
		}
		
		Command cmd = null;
		
		try{
			
			if( commandMap.containsKey(cmdKey) ){			// hashmap에 key값이 포함되어 있는게 있는지 찾는거
				cmd = (Command)commandMap.get(cmdKey);		// hashmap에서 key값의 value를 가져옴.
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request, response );		// 오버라이딩 된 execute가 불러짐.

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );

		
	}
	
	
}
