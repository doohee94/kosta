package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.basic.Command;
import mybatis.diary.model.Diary;
import service.diary.DiaryService;

public class DiaryList implements Command{
	   String next;
	   
	   public DiaryList(String _next){

	      next = _next;
	   }


	public String execute(HttpServletRequest request , HttpServletResponse response) {
		String memberId = request.getParameter("id");
		String coupleId = request.getParameter("cid");
		List<Diary> list = DiaryService.getInstance().selectList(memberId, coupleId);
		request.setAttribute("param", list);
		
		
		return next;
	}
}
