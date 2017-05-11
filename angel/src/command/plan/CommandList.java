package command.plan;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import command.basic.Command;
import command.basic.CommandException;
import model.plan.PlanVo;
import repository.plan.PlanRepository;
import service.plan.PlanService;

public class CommandList implements Command{
	
	String next;
	
	public CommandList(String _next){

		next = _next;
	}

	
	public String execute(HttpServletRequest request,HttpServletResponse response) throws CommandException {
	
		
		try {
			
			//플랜 vo에 담아오는게 편하겟지? 그렇지..?
			List<PlanVo> plan = PlanService.getInstance().selectList();
			
			JSONObject obj = new JSONObject();

			JSONArray jArray = new JSONArray();
				
			for(int i=0; i<plan.size();i++){
				
				JSONObject sObject = new JSONObject();
				
				sObject.put("id",plan.get(i).getPlanNum());
				sObject.put("title",plan.get(i).getPlanContent());
				sObject.put("start",plan.get(i).getPlanSdate());
				sObject.put("end",plan.get(i).getPlanEdate());
				
				jArray.add(sObject);
			}
				
				System.out.print(jArray.toString() +"\n");
				obj.put(null, jArray);
				
			response.getWriter().println(jArray.toString());
		} 
			catch (Exception e) {
			
			e.printStackTrace();
		}
	
		
		return next;
	

}//익스큐트 끝!
	
}
