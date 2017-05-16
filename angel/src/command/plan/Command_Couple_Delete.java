package command.plan;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import service.plan.PlanService;

public class Command_Couple_Delete implements Command {
		String next;
		public Command_Couple_Delete(String _next){
			next = _next;
		}
	
		public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
			
			PlanService.getInstance().delete(Integer.parseInt(request.getParameter("id")));
			
			
			return next;
		}
		
		
}
