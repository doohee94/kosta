package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import model.diary.DiaryVo;
import service.diary.DiaryService;

public class DiaryList implements Command{
	   String next;
	   
	   public DiaryList(String _next){

	      next = _next;
	   }


	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		List<DiaryVo> list = DiaryService.getInstance().selectList();
		
		request.setAttribute("param", list);
		
		
		
		
		return next;
	}
}
