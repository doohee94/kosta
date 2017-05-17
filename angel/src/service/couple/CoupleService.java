package service.couple;

import model.user.MemberVo;
import repository.Login.LoginRepository;
import repository.couple.CoupleRepository;

public class CoupleService {
	
	// web이니까 single ton Pattern으로 생성해야쥐
	public static CoupleService service;
	
	// 다른 곳에서 절대 new로 생성하지 못함
	private CoupleService(){
	}
	
	public static CoupleService getInstance(){
		if(service==null) service = new CoupleService();
		return service;
	}
	
	CoupleRepository repo = new CoupleRepository();
	
	public MemberVo selectMember(MemberVo memberVo){
		return repo.selectMember(memberVo);
	}

	public MemberVo selectCouple(MemberVo member) {
		// TODO Auto-generated method stub
		return repo.selectCouple(member);
	}

	public int breakCouple(String id) {
		return repo.breakCouple(id);
		
	}

	

}
