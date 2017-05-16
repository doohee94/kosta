package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import model.user.MemberVo;
import service.login.LoginService;

public class CommandSearchPw implements Command {
	
	String next;
	public CommandSearchPw(String _next) {
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		try{
			
			String id = request.getParameter("id");
			String tel = request.getParameter("tel");
		
			System.out.println("ajax로 가져온 아이디 잘 가져오나.."+id);
			System.out.println("ajax로 가져온 아이디 잘 가져오나.."+tel);
		
			MemberVo search = new MemberVo();
			search.setMemberId(id);
			search.setMemberTel(tel);
			
			MemberVo searchId = LoginService.getInstance().searchPw(search);
			
			String result = "";
			
			if(searchId.getMemberPw()==null){
				// 고객이 이름과, 핸드폰을 입력해서 정보가 없다면
				result = "you can't find your password";
			}else{
				// 고객 정보가 있다면!!! 아이디를 아려줘야지.
				result = searchId.getMemberPw();
			}
			System.out.println("비번을 찾은 결과는?? 과연???"+result);
	
			response.getWriter().print(result);
		}catch(Exception ex){
			
		}
		return next;
	}

}
