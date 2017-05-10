package command.basic;

import javax.servlet.http.HttpServletRequest;

public class CommandNull implements Command{
	private String next;

	public CommandNull( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request ){
		return next;
	}

}
