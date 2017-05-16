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

//		System.out.println("로그인 할 때의 아이디 : " + request.getParameter("id"));
//		System.out.println("로그인 할 때의 비밀번호 : " + request.getParameter("pw"));
		// 아이디와 비밀번호를 서비스로 gogo
		MemberVo memberVo = new MemberVo();
		MemberVo loginVo = new MemberVo();
		
		memberVo.setMemberId(request.getParameter("id"));
		memberVo.setMemberPw(request.getParameter("pw"));
				
		// select 한 결과를 담아요~~~ (로그인 정보의 결과 : member 있으면 true값임!!!)
		loginVo = LoginService.getInstance().selectMember(memberVo);
		
		
		
		if(loginVo!=null){

			String loginId = loginVo.getMemberId();
			String loginCoupleId = loginVo.getMemberCouple();
			
			System.out.println("로그인 한 아이디 : " + loginId);	
			System.out.println("로그인 한 멤버의 커플 아이디 : " + loginCoupleId);		
			
			// 로그인 후, 로그인한 아이디, 로그인 한 사람의 커플 아이디를 가져 와야 함다!
			request.setAttribute("id", loginId);
			request.setAttribute("couple", loginCoupleId);
	

			return next;
		}
		else{
			request.setAttribute("loginCheck", "false");
			return "/main/LoginView.jsp";
		}
		
	}

}
