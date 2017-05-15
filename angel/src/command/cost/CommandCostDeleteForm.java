package command.cost;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import service.cost.CostService;

public class CommandCostDeleteForm implements Command{
	private String next;
	
	public CommandCostDeleteForm(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		//memberId와 costNum받아서 변수에 넣기
		String memberId = request.getParameter("memberId");
		String cost = request.getParameter("costNo");
		int costNum = Integer.parseInt(cost);
		CostService.getInstance().deleteCost(memberId,costNum);
		return next;
	}

}
