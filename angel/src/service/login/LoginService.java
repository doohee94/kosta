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
	
	public boolean selectMember(MemberVo memberVo){
		return repo.selectMember(memberVo);
	}

	public int inputMember(MemberVo memberVo) {
		return repo.imputMember(memberVo);
	}

	// 내가 입력한 아이디가 있는지 없는지 아이디를 체크하는 것임.
	public String idCheck(String inputId) {
		return repo.idcheck(inputId);
	}
	

}
