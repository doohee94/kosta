package command.cost;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import model.cost.CostVo;
import service.cost.CostService;

public class CommandCostModifyForm implements Command{
	private String next;
	
	public CommandCostModifyForm(String _next){
		next=_next;
	}
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
		CostVo vo = new CostVo();
		//파라메터값 vo에 담기
		String costNo = request.getParameter("costNo");
		vo.setMemberId(request.getParameter("memberId"));
		vo.setCostDate(request.getParameter("day"));
		vo.setCostContent(request.getParameter("content"));
		vo.setCostCategory(request.getParameter("category"));
		vo.setCostMoney(request.getParameter("cost"));
		vo.setCostNum(Integer.parseInt(costNo));
		//서비스 호출
		CostService.getInstance().modifyCost(vo);
		return next;
	}

}
