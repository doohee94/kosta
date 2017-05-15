package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import service.login.LoginService;

public class CommandIdCheck implements Command {
	
	String next;
	public CommandIdCheck(String _next) {
		 next=_next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		try{
		String inputId = request.getParameter("id");
//		System.out.println("ajax로 가져온 아이디 잘 가져오나.."+inputId);
		
		String idCheckResult = LoginService.getInstance().idCheck(inputId);
//		System.out.println("idCheckResult의 결과값은" + idCheckResult);
		
		//ajax로 결과를 넘기는 방법!!!!!!!!! response를 이용해야 함.
//		request.setAttribute("idCheck", idCheckResult);
		response.getWriter().print(idCheckResult);
		}catch(Exception ex){
			
		}
		return next;
	}

}
