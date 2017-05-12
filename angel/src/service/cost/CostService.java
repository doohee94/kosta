package service.cost;

import java.util.List;

import model.cost.CostVo;
import repository.cost.CostRepository;

public class CostService {
	private static CostService service;
	
	private CostService(){}
	
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
