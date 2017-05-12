package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import model.user.MemberVo;
import service.login.LoginService;


// 제일 처음 로딩되는 화면에서 로그인을 시켜라!
public class CommandLogin implements Command{
	
	String next;
	public CommandLogin(String _next){
		next=_next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {

		System.out.println("로그인 할 때의 아이디 : " + request.getParameter("id"));
		System.out.println("로그인 할 때의 비밀번호 : " + request.getParameter("pw"));
		// 아이디와 비밀번호를 서비스로 gogo
		MemberVo memberVo = new MemberVo();
		
		memberVo.setMemberId(request.getParameter("id"));
		memberVo.setMemberPw(request.getParameter("pw"));
				
		// select 한 결과를 담아요~~~ (로그인 정보의 결과 : member 있으면 true값임!!!)
		boolean login = LoginService.getInstance().selectMember(memberVo);
		System.out.println("select 한 결과값은??"+login);
		
		if(login==true){
			return next;
		}
		else{
			request.setAttribute("loginCheck", "false");
			return "LoginView.jsp";
		}
		
	}

}
