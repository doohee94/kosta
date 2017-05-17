package command.basic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandNull implements Command{
	private String next;

	public CommandNull( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request ,HttpServletResponse response ){
		return next;
	}

}
