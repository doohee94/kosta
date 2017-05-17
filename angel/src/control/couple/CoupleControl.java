package control.couple;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.*;
import command.couple.CommandBreak;
import command.couple.CommandCouple;
import command.user.*;


/**
 * Servlet implementation class UserControl
 */
@WebServlet("/CoupleControl")
public class CoupleControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap commandMap;
	//private String	jspDir = "/plan/plan_person/";
	private String error = "/main/error.jsp";
	
	
    public CoupleControl() {
        super();
        initCommand();
    }

	private void initCommand() {
		System.out.println("couple)command를 탄다...!!!");
		commandMap = new HashMap();
		commandMap.put("couple-main", new CommandCouple("/couple/CoupleMainView.jsp"));
		commandMap.put("couple_break_page", new CommandCouple("/main/couple_break.jsp"));
		
		commandMap.put("CoupleBreak", new CommandBreak("/plan/plan_person/home.jsp"));
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

		String ajax = request.getParameter("ajax");
		if(ajax!=null&&ajax.equals("true")) return;
		
		RequestDispatcher reqDp = getServletContext().getRequestDispatcher(nextPage);
		reqDp.forward( request, response );

		
	}
	
	
}
