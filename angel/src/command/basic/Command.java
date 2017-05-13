package command.basic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.basic.*;


public interface Command {
	public String execute( HttpServletRequest request ,HttpServletResponse response)  throws CommandException;
}
