package command.cost;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import model.cost.CostVo;
import service.cost.CostService;

public class CommandCostInput implements Command{
	private String next;
	
	public CommandCostInput(String _next){
		next=_next;
	}

	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {

		CostVo vo= new CostVo();
		vo.setMemberId(request.getParameter("memberId"));
		vo.setCostDate(request.getParameter("day"));
		vo.setCostContent(request.getParameter("content"));
		vo.setCostCategory(request.getParameter("category"));
		vo.setCostMoney(request.getParameter("cost"));
		CostService.getInstance().inputCost(vo);
		return next;		
	}
	
}
