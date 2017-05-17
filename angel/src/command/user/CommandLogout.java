package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.basic.Command;
import command.basic.CommandException;

public class CommandLogout implements Command{
		private String next ;
		
		public CommandLogout (String _next){
			next = _next ;
		}

		public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
				
			//세션 날리기
			HttpSession session = request.getSession();
			session.removeAttribute("loginId");
			session.removeAttribute("coupleId");
			
			return next;
		}
		
}
