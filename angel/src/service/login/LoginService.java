package service.login;

import model.user.MemberVo;
import repository.Login.LoginRepository;

public class LoginService {
	
	// web이니까 single ton Pattern으로 생성해야쥐
	public static LoginService service;
	
	// 다른 곳에서 절대 new로 생성하지 못함
	private LoginService(){
	}
	
	public static LoginService getInstance(){
		if(service==null) service = new LoginService();
		return service;
	}
	
	LoginRepository repo = new LoginRepository();
	
	public int selectMember(MemberVo memberVo){
		return repo.selectMember(memberVo);
	}
	

}
