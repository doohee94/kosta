package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.basic.Command;
import mybatis.diary.model.Diary;
import service.diary.DiaryService;

public class DiarySave implements Command {
	String next;
	public DiarySave(String _next){
		next = _next;
	}
	public String execute(HttpServletRequest request, HttpServletResponse response){
		
		Diary d = new Diary();
		
		HttpSession session  = request.getSession();
		
		
		d.setDiaryContent(request.getParameter("content"));
		d.setDiaryDate(request.getParameter("dProd"));
		d.setDiaryTitle(request.getParameter("title"));
		d.setDiaryWeather(request.getParameter("weather"));
		d.setMemberId((String)session.getAttribute("loginId"));
		
		DiaryService.getInstance().insertView(d);
		
		String memberId = (String)session.getAttribute("loginId");
		String coupleId = null;
		List<Diary> list = DiaryService.getInstance().selectList(memberId, coupleId);
		request.setAttribute("param", list);
		
		return next;
	}
}
