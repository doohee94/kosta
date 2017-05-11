package service.cost;

import java.util.List;

import model.cost.CostVo;
import repository.cost.CostRepository;
import service.plan.PlanService;

public class CostService {
	public static CostService service;
	
	private CostService(){	
	}
	public static CostService getInstance(){
		
		if(service == null)
		{
			service =  new CostService();
		}
		return service;
	}
	CostRepository repo = new CostRepository();
	
	public List<CostVo> selectCostList(){
		return repo.selectCostList();
	}
	
}
