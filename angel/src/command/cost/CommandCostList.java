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
			List<CostVo> cost = CostService.getInstance().selectCostList();

			JSONObject obj = new JSONObject();
			JSONArray jArray = new JSONArray();
			for(int i=0; i<cost.size();i++){

				JSONObject sObject = new JSONObject();

				sObject.put("id",cost.get(i).getMemberId());
				sObject.put("title",cost.get(i).getCostContent());
				sObject.put("start",cost.get(i).getCostDate());
				sObject.put("end",cost.get(i).getCostDate());


				jArray.add(sObject);
			}

			System.out.print(jArray.toString() +"\n");
			obj.put(null, jArray);

			response.getWriter().println(jArray.toString());

		}catch (Exception e) {

			e.printStackTrace();
		}


		return next;
	}
}