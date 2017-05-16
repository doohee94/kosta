package command.couple;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.basic.Command;
import command.basic.CommandException;
import model.user.MemberVo;
import service.couple.CoupleService;



// 제일 처음 로딩되는 화면에서 로그인을 시켜라!
public class CommandCouple implements Command{
	
	String next;
	public CommandCouple(String _next){
		next=_next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
		
		System.out.println("CommandCouple)로그인한 아이디 :   "+request.getParameter("id"));
		
		
		// 받아와야 할 것은
		// 1. 로그인한 사람의 파일 경로
		// 2. 로그인한 사람의 커플의 파일 경로
		// 3. 로그인한 사람의 사귄 날짜
		
		MemberVo member = new MemberVo();
		MemberVo couple = new MemberVo();
		
		member.setMemberId(request.getParameter("id"));
		
		member = CoupleService.getInstance().selectMember(member);
		System.out.println("CommandCouple.java)로그인한 사람의 파일 경로" + member.getPhotoRealpath());
		request.setAttribute("memberPath", member.getPhotoRealpath());
		
		if(member.getMemberCouple()==null){
			// 로그인한 사람이 솔로일 경우
			request.setAttribute("couple", "no");
			request.setAttribute("couplePath", "/angel/profile/null.jpg");			
		}else{
			// 로그인한 사람이 커플일 경우
			request.setAttribute("couple", "yes");
			couple = CoupleService.getInstance().selectCouple(member);
			
			System.out.println("CommandCouple)couple의 파일 경로   " + couple.getPhotoRealpath());
			
			request.setAttribute("couplePath", couple.getPhotoRealpath());			
			
		}

		return next;
		
	}

}
