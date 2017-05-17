package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.basic.Command;
import mybatis.diary.model.Diary;
import service.diary.DiaryService;

public class DiaryModify implements Command{
	String next;
	public DiaryModify(String _next){
		next = _next;
	}
	public String execute(HttpServletRequest request, HttpServletResponse response){
		try{
		Diary d = new Diary();
		System.out.println("야야야ㅑㅑ야야야야야"+request.getParameter("id"));
		d.setDiaryNum(request.getParameter("diarynum"));
		d.setDiaryContent(request.getParameter("content"));
		d.setDiaryDate(request.getParameter("dProd"));
		d.setDiaryTitle(request.getParameter("title"));
		d.setDiaryWeather(request.getParameter("weather"));
		d.setMemberId(request.getParameter("id"));
		//d.setDiaryCoupleck(request.getParameter("cid"));
		
		DiaryService.getInstance().modifyView(d);
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("loginId");
		String coupleId = (String)session.getAttribute("coupleId");
		memberId="ckswhd1128";
		coupleId="aaaa";
		List<Diary> list = DiaryService.getInstance().selectList(memberId, coupleId);
		request.setAttribute("param", list);
		}catch(Exception ex){
			System.out.println(ex.toString());
		}
		
		
		return next;
	}
}
