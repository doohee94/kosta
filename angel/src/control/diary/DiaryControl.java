package control.diary;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import command.basic.CommandNull;
import command.diary.DiaryList;
import command.diary.DiaryView;








public class DiaryControl extends HttpServlet {
	private HashMap commandMap;
	private String	jspDir = "/";
	private String  error = "error.jsp";
   
    public DiaryControl() {
        super();
        initCommand();
    }
    private void initCommand(){
		commandMap = new HashMap();

		commandMap.put("main-page",	new CommandNull("main.jsp") );
		commandMap.put("list-page",	new DiaryList("diary_person_list.jsp") );
		// 나머지도 추가하기		
		commandMap.put("view-page",	new DiaryView("diary_person_view.jsp") );
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request, response);
	}
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		if( cmdKey == null ){
			cmdKey = "main-page";
		}
		Command cmd = null;
		try{
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (Command)commandMap.get( cmdKey);
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}
			nextPage = cmd.execute( request ,response);
		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}
		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
	}
}
