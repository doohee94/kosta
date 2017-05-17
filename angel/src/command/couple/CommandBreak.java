package command.couple;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.basic.Command;
import command.basic.CommandException;
import model.user.MemberVo;
import service.couple.CoupleService;

public class CommandBreak implements Command{
	
	String next;
	public CommandBreak(String _next){
		next=_next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
		
		System.out.println("CommandBreak)아이디 :   "+request.getParameter("id"));
		System.out.println("CommandBreak)커플 아이디 :   "+request.getParameter("cid"));
		
		String id = request.getParameter("id");
		String cid = request.getParameter("cid");
		
		
		// 나의 커플이름, 커플날짜를 null로
		CoupleService.getInstance().breakCouple(id);
		
		// 커플의 커플이름, 커플날짜를 null로
		CoupleService.getInstance().breakCouple(cid);
		
		request.setAttribute("couple", null);
		
		return next;
		
	}

}
