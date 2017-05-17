package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import model.user.MemberVo;
import service.login.LoginService;

// 회원정보 수정하는 화면을 보여줄꺼다
public class CommandModifyView implements Command {
	
	String next;
	public CommandModifyView(String _next) {
		 next=_next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		try{
		String id = request.getParameter("id");
		System.out.println("CommandModifyView.java)아이디 잘 가져오나.."+id);
		
		MemberVo member = LoginService.getInstance().ModifyView(id);
//		System.out.println("idCheckResult의 결과값은" + idCheckResult);
		
		
		request.setAttribute("modifyMember", member);
		

		}catch(Exception ex){
			
		}
		return next;
	}

}
