package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.basic.Command;
import mybatis.diary.model.Diary;
import service.diary.DiaryService;

public class CoupleDiaryList implements Command{
	String next;
	public CoupleDiaryList(String _next){
		next = _next;
	}
	public String execute(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("loginId");
		String coupleId = (String)session.getAttribute("coupleId");
		memberId="ckswhd1128";
		coupleId = "aaaa";
		List<Diary> list = DiaryService.getInstance().selectList(memberId, coupleId);
		request.setAttribute("param", list);
		return next;
	}
}
