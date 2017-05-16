package command.plan;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import model.plan.PlanVo;
import service.plan.PlanService;

public class Command_Couple_Modify implements Command{
	String next;
	
	public Command_Couple_Modify(String _next){
		next = _next;
	}

	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String sDay = request.getParameter("sDay");
		String eDay = request.getParameter("eDay");
		
		
		PlanVo vo = new PlanVo();
		vo.setPlanNum(id);
		vo.setPlanSdate(sDay);
		vo.setPlanEdate(eDay);
		
		PlanService.getInstance().update(vo);
		
		return next;
	}
	
	
}
