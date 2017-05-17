package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import mybatis.diary.model.Diary;
import service.diary.DiaryService;

public class CoupleDiarySave implements Command{
	String next;
	public CoupleDiarySave(String _next){
		next = _next;
	}
	public String execute(HttpServletRequest request, HttpServletResponse response){
		Diary d = new Diary();
		d.setDiaryContent(request.getParameter("content"));
		d.setDiaryDate(request.getParameter("dProd"));
		d.setDiaryTitle(request.getParameter("title"));
		d.setDiaryWeather(request.getParameter("weather"));
		d.setMemberId(request.getParameter("id"));
		d.setDiaryCoupleck(request.getParameter("cid"));
		
		DiaryService.getInstance().insertViewCouple(d);
		
		String memberId = request.getParameter("id");
		String coupleId = request.getParameter("cid");
		List<Diary> list = DiaryService.getInstance().selectList(memberId, coupleId);
		request.setAttribute("param", list);
		
		return next;
	}
}
