package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;

public class CommandSearchIdpw implements Command {
	
	String next;
	public CommandSearchIdpw(String _next) {
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		// TODO Auto-generated method stub
		return next;
	}

}
