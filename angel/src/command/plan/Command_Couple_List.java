package command.plan;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import command.basic.Command;
import command.basic.CommandException;
import model.plan.PlanVo;
import service.plan.PlanService;

public class Command_Couple_List implements Command{

	String next;
	
	public Command_Couple_List(String _next){
		next = _next;
	}

	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		String id = request.getParameter("id");
		String cid = request.getParameter("cid");
		
	try {
		
			//플랜 vo에 담아오는게 편하겟지? 그렇지..?
			List<PlanVo> plan = PlanService.getInstance().selectList(id, cid);
			
			
			JSONObject obj = new JSONObject();

			JSONArray jArray = new JSONArray();
				
			for(int i=0; i<plan.size();i++){
				
				JSONObject sObject = new JSONObject();
				
				sObject.put("id",plan.get(i).getPlanNum());
				sObject.put("title",plan.get(i).getPlanContent());
				sObject.put("start",plan.get(i).getPlanSdate());
				sObject.put("end",plan.get(i).getPlanEdate());
				sObject.put("color","#"+plan.get(i).getPlanColor());
				
				jArray.add(sObject);
			}
				
				obj.put(null, jArray);
				
				response.getWriter().println(jArray.toString());
		} 
			catch (Exception e) {
			
			e.printStackTrace();
		}
	
		
		
		
		
		
		
		return next;
	}

}
