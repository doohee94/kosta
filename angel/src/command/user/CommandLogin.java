package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;


// 제일 처음 로딩되는 화면에서 로그인을 시켜라!
public class CommandLogin implements Command{
	
	
	String next;
	public CommandLogin(String _next){
		next=_next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		// TODO Auto-generated method stub
		return next;
	}

}
