package command.plan;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import model.plan.PlanVo;
import service.plan.PlanService;

public class CommandInsert implements Command{
	
	String next;
	
	public CommandInsert(String _next){
		System.out.println("인서트 커맨드");
		next = _next;
	}

	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
	
		PlanVo vo = new PlanVo();
		
		vo.setMemberId("1234");
		vo.setPlanSdate(request.getParameter("startDay"));
		vo.setPlanEdate(request.getParameter("endDay"));
		vo.setPlanContent( request.getParameter("title"));
		
		
		PlanService.getInstance().Insert(vo);
		
		return next;
	}

}
