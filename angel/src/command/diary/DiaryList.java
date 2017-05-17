package command.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.basic.Command;
import mybatis.diary.model.Diary;
import service.diary.DiaryService;

public class DiaryList implements Command{
	   String next;
	   
	   public DiaryList(String _next){

	      next = _next;
	   }


	public String execute(HttpServletRequest request , HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("loginId");
		String coupleId = null;
		
		System.out.println("커맨드에서 member>>>>>>>>"+memberId);
		System.out.println("커맨드에서 member>>>>>>>>"+coupleId);
		List<Diary> list = DiaryService.getInstance().selectList(memberId, coupleId);
		request.setAttribute("param", list);
		
		
		return next;
	}
}
