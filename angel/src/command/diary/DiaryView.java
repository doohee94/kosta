package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import model.diary.DiaryVo;
import service.diary.DiaryService;

public class DiaryView implements Command {
	String next;
	public DiaryView(String _next){
		next = _next;
	}
	public String execute(HttpServletRequest request, HttpServletResponse response){
		
		
		int diarynum =Integer.parseInt(request.getParameter("diarynum"));
		DiaryVo list = DiaryService.getInstance().selectView(diarynum);
		request.setAttribute("param", list);
		return next;
	}

}
