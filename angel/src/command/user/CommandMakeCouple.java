package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import service.login.LoginService;

public class CommandMakeCouple implements Command{
	String next;
	
	public CommandMakeCouple(String _next){
		
		next = _next;
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
		String id = request.getParameter("id");
		String cid = request.getParameter("cid");
		String date = request.getParameter("date");
		System.out.println(id+cid+date);
		
		LoginService.getInstance().makeCouple(id, cid, date);
		
		return next;
	}

}
