package control.cost;

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
import command.cost.CommandCostDeleteForm;
import command.cost.CommandCostInput;
import command.cost.CommandCostList;
import command.cost.CommandCostModifyForm;




public class CostControl extends HttpServlet {
	private HashMap commandMap;   
	private String	jspDir = "/cost/";
	private String  error = "/main/error.jsp";

    public CostControl() {
        super();
        initCommand();

    }
    private void initCommand(){
    	//commandMap에 명령문 담기
    	commandMap = new HashMap();
    	commandMap.put("cost-main", new CommandNull("main.jsp"));
    	commandMap.put("cost-list", new CommandCostList("home.jsp"));
    	commandMap.put("input-cost", new CommandCostInput("home.jsp"));
    	commandMap.put("modify-cost", new CommandCostModifyForm("home.jsp"));
    	commandMap.put("delete-cost", new CommandCostDeleteForm("home.jsp"));
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		//cmdKey ="list-page"
		if( cmdKey == null ){
			cmdKey = "main-page";
		}

		
		Command cmd = null;

		try{
			//commandMap에서 cmdKey값 비교후 명령 실행
			if( commandMap.containsKey( cmdKey) ){ //.toLowerCase() 			//Hash맵의 있는지 
				cmd = (Command)commandMap.get( cmdKey); //.toLowerCase() //벨류값 가져오기
//				cmd = new CommandList("listMessage.jsp")
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request , response ); //명령실행
//          nextPage =listMessage.jsp
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
