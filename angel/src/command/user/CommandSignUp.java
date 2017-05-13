package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import model.user.MemberVo;
import service.login.LoginService;

// 회원가입하는 Command
public class CommandSignUp implements Command {
	
	String next;
	public CommandSignUp(String _next){
		next=_next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
		MemberVo memberVo = new MemberVo();
		memberVo.setMemberId(request.getParameter("id"));
		memberVo.setMemberPw(request.getParameter("pw"));
		memberVo.setMemberName(request.getParameter("name"));
		memberVo.setMemberGender(request.getParameter("gender"));
		memberVo.setMemberTel(request.getParameter("tel"));
		memberVo.setMemberBirth(request.getParameter("birth"));
		//memberVo.setMember(request.getParameter("id"));
		
		int signup = LoginService.getInstance().inputMember(memberVo);
		
		return null;
	}

}
