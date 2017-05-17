package command.plan;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		System.out.println(">>>>>>>>>>>>>>>"+(request.getParameter("color")));
		System.out.println("여기를 안돌아..?왜...?왜떔시..?");
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("loginId"));
		System.out.println(">>>>>>>>>>>>>>>"+(String)session.getAttribute("loginId"));
		vo.setPlanSdate(request.getParameter("startDay"));
		vo.setPlanEdate(request.getParameter("endDay"));
		vo.setPlanContent( request.getParameter("title"));
		vo.setPlanColor( request.getParameter("color"));
		
		PlanService.getInstance().Insert(vo);
		
		
		return next;
	}

}
