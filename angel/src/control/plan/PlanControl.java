package control.plan;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.*;
import command.plan.CommandDelete;
import command.plan.CommandInsert;
import command.plan.CommandList;
import command.plan.CommandModify;





public class PlanControl extends HttpServlet {
	private HashMap commandMap;
	private String	jspDir = "/plan/plan_person/";
	private String  error = "error.jsp";
  
    public PlanControl() {
        super();
        initCommand();
    }

    private void initCommand(){
		commandMap = new HashMap();

		commandMap.put("main-page",new CommandNull("main.jsp") );
		commandMap.put("list-page",new CommandList("home.jsp") );
		commandMap.put("insert-page",new CommandInsert("home.jsp") );
		commandMap.put("modify-page",new CommandModify("home.jsp") );
		commandMap.put("delete-page",new CommandDelete("home.jsp") );
		// 나머지도 추가하기		
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd"); //list-page
	
		if( cmdKey == null ){
			cmdKey = "main-page";
		}

		
		Command cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (Command)commandMap.get( cmdKey); //new CommandList("listMessage.jsp"
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request ,response);

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		String ajax = request.getParameter("ajax");
		if(  ajax !=null && ajax.equals("true")) return;
		
		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}

}


