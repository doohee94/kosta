package command.cost;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import command.basic.Command;
import command.basic.CommandException;
import model.cost.CostVo;
import service.cost.CostService;

public class CommandCostList implements Command{
	private String next;

	public CommandCostList(String _next){
		next=_next;
	}

	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException
	{
		try{
			//멤버아이디 받아오기
			String memberId =request.getParameter("memberId");
			//null값일때의 멤버아이디 처리 
			if(memberId == null){
				return next;
			}
			//서비스 호출후 list에 담기
			List<CostVo> cost = CostService.getInstance().selectCostList(memberId);
			//json에 	cost담기
			JSONObject obj = new JSONObject();
			JSONArray jArray = new JSONArray();
			for(int i=0; i<cost.size();i++){
				String color = cost.get(i).getCostCategory();
				JSONObject sObject = new JSONObject();
					
				sObject.put("id",cost.get(i).getCostNum()+"-"+cost.get(i).getCostMoney()+"-"+cost.get(i).getCostCategory());
				sObject.put("title",cost.get(i).getCostContent());
				sObject.put("start",cost.get(i).getCostDate());
				sObject.put("end",cost.get(i).getCostDate());

				if(color.equals("Eating")){
					sObject.put("color","#FF00DD");
				}else if(color.equals("Playing")){
					sObject.put("color","#FFBB00");
				}else if(color.equals("ETC")){
					sObject.put("color","#00D8FF");
				}

					
					
				jArray.add(sObject);
			}

			obj.put(null, jArray);
			//달력에 json보내기
			response.getWriter().print(jArray.toString());

		}catch (Exception e) {

			e.printStackTrace();
		}


		return next;
	}
}
