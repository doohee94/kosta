package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import command.basic.Command;
import mybatis.diary.model.Diary;
import service.diary.DiaryService;

public class DiaryView implements Command {
	String next;
	public DiaryView(String _next){
		next = _next;
	}
	public String execute(HttpServletRequest request){
		
		
		int diarynum =Integer.parseInt(request.getParameter("diarynum"));
		Diary list = DiaryService.getInstance().selectView(diarynum);
		request.setAttribute("param", list);
		return next;
	}

}
