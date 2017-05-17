package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.basic.Command;
import mybatis.diary.model.Diary;
import service.diary.DiaryService;

public class DiaryDelete implements Command{
	String next;
	public DiaryDelete(String _next){
		next = _next;
	}
	public String execute(HttpServletRequest request, HttpServletResponse response ){
		int diarynum = Integer.parseInt(request.getParameter("diarynum"));
		System.out.println("커맨드>>>>>>>>>>>>>>>"+diarynum);
		DiaryService.getInstance().deleteView(diarynum);
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("loginId");
		String coupleId = (String)session.getAttribute("coupleId");

		System.out.println("커맨드에서 아이디 >>>>"+memberId);
		System.out.println("커맨드에서 커ㅠㅡㄹ아이디 >>>>"+coupleId);
		List<Diary> list = DiaryService.getInstance().selectList(memberId, coupleId);
		request.setAttribute("param", list);
		return next;
	}
}
