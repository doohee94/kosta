package command.plan;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import model.plan.PlanVo;
import service.plan.PlanService;

public class Command_Couple_Insert implements Command{
	String next;

	
	public Command_Couple_Insert(String _next){
		next = _next;
	}

	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
			
		PlanVo vo = new PlanVo();
		System.out.println(">>>>>>>>>>>>>>>"+(request.getParameter("color")));
		vo.setMemberId( request.getParameter("id"));
		vo.setPlanSdate(request.getParameter("startDay"));
		vo.setPlanEdate(request.getParameter("endDay"));
		vo.setPlanContent( request.getParameter("title"));
		vo.setPlanColor( request.getParameter("color"));
		vo.setPlanCoupleck(request.getParameter("cid"));
		
		PlanService.getInstance().Insert(vo);
		
		return next;
	}

}
