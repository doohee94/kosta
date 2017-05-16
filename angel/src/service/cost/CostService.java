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

	//select
	public List<CostVo> selectCostList(String memberId){
		return repo.selectCostList(memberId);
	}
	//insert
	public int inputCost(CostVo vo){
		return repo.insertCost(vo);
	}
	//modify
	public int modifyCost(CostVo vo){
		return repo.modifyCost(vo);
	}
	//delete
	public int deleteCost(String memberId, int costNum){
		return repo.deleteCost(memberId, costNum);
	}

}
