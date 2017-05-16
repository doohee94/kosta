package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import command.basic.CommandException;
import model.user.MemberVo;
import service.login.LoginService;

public class CommandSearchId implements Command {
	
	String next;
	public CommandSearchId(String _next) {
		System.out.println("CommandSearchId를 탄다!!!!!!!!!!!!!!!!!!!!!!!");
		 next=_next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		try{
		
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
		
			System.out.println("ajax로 가져온 아이디 잘 가져오나.."+name);
			System.out.println("ajax로 가져온 아이디 잘 가져오나.."+tel);
		
			MemberVo search = new MemberVo();
			search.setMemberName(name);
			search.setMemberTel(tel);
			
			MemberVo searchId = LoginService.getInstance().searchId(search);
			
			String result = "";
			
			if(searchId.getMemberName()==null){
				// 고객이 이름과, 핸드폰을 입력해서 정보가 없다면
				result = "you can't find your Id";
			}else{
				// 고객 정보가 있다면!!! 아이디를 아려줘야지.
				result = searchId.getMemberId();
			}
			System.out.println("아이디를 찾은 결과는?? 과연???"+result);
	
			response.getWriter().print(result);
		}catch(Exception ex){
			
		}
		return next;
	}

}
