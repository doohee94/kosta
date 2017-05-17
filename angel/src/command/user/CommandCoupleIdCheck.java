package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import command.basic.Command;
import command.basic.CommandException;
import service.login.LoginService;

public class CommandCoupleIdCheck implements Command{
		String next;
		public CommandCoupleIdCheck(String _next){
			next = _next;
		}
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
		try{
		String cid = request.getParameter("cid");

		String result = LoginService.getInstance().selectCouple(cid);
		
		response.getWriter().print(result);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return next;
	}

}
