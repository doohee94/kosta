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
import command.diary.CoupleDiaryList;
import command.diary.CoupleDiarySave;
import command.diary.DiaryDelete;
import command.diary.DiaryList;
import command.diary.DiaryModify;
import command.diary.DiaryResearch;
import command.diary.DiarySave;
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

		commandMap.put("main-page",	new CommandNull("main.jsp"));
		commandMap.put("list-page",	new DiaryList("home.jsp"));
		
		commandMap.put("view-page",	new DiaryView("diary_person_view.jsp"));
		commandMap.put("insert-do",	new DiarySave("home.jsp"));
		commandMap.put("insert-page",new CommandNull("diary_person_save.jsp"));
		commandMap.put("delete",new DiaryDelete("home.jsp"));
		
		commandMap.put("modify-do",	new DiaryModify("home.jsp"));	
		commandMap.put("update-page",new DiaryView("diary_person_modify.jsp"));
		
		commandMap.put("list-research",new DiaryResearch("home.jsp"));
		
		//couple
		commandMap.put("list-page-couple",	new CoupleDiaryList("/diary_couple/home.jsp"));
		commandMap.put("insert-page-couple",new CommandNull("/diary_couple/diary_couple_save.jsp"));
		commandMap.put("insert-do-couple",	new CoupleDiarySave("/diary_couple/home.jsp"));
		commandMap.put("delete-couple",new DiaryDelete("/diary_couple/home.jsp"));
		commandMap.put("update-page-couple",new DiaryView("/diary_couple/diary_couple_modify.jsp"));
		commandMap.put("modify-do-couple",	new DiaryModify("/diary_couple/home.jsp"));
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
