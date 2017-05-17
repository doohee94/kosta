package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.basic.Command;
import mybatis.diary.model.Diary;
import service.diary.DiaryService;

public class DiaryResearch implements Command {
	String next;
	public DiaryResearch(String _next){
		next = _next;
	}
	public String execute(HttpServletRequest request, HttpServletResponse response){
		String diarydate = request.getParameter("date");
		
		System.out.println("커맨드>>>>>>>>>>>>>>"+diarydate);
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("loginId");
		String coupleId =null;
		
		
		List<Diary> list = DiaryService.getInstance().researchList(memberId,diarydate);
		request.setAttribute("param", list);
		
		request.setAttribute("date", diarydate);
		
		return next;
	}
}
