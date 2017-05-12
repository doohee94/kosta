package service.plan;

import java.util.List;

import model.plan.PlanVo;
import repository.plan.PlanRepository;

public class PlanService {

	private static PlanService service;
	
	private PlanService(){}
	
	public static PlanService getInstance(){
		
		if(service == null)
		{
			service =  new PlanService();
		}
		return service;
	}
	
	
	PlanRepository repo = new PlanRepository();
	
	
	public List<PlanVo> selectList(){
		return repo.selectList();
	}
	
	
	public int Insert(PlanVo vo){
		System.out.println("인서트 서비스");
		return repo.Insert(vo);
		
	}
	
	
}
