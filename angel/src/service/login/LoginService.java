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
	
	public MemberVo selectMember(MemberVo memberVo){
		return repo.selectMember(memberVo);
	}

	public int inputMember(MemberVo memberVo) {
		return repo.imputMember(memberVo);
	}

	// 내가 입력한 아이디가 있는지 없는지 아이디를 체크하는 것임.
	public String idCheck(String inputId) {
		return repo.idcheck(inputId);
	}
	
	//커플 쳌쳌
	public String selectCouple(String cid){
		System.out.println("서비스여기탐?????");
		return repo.selectCouple(cid);
	}
	
	public int makeCouple(String id, String cid, String date){
		return repo.makeCouple(id, cid, date);
	}

	public MemberVo searchId(MemberVo search) {
		System.out.println("searchID서비스여기탐?????");
		return repo.searchId(search);
	}

	public MemberVo searchPw(MemberVo search) {
		System.out.println("searchID서비스여기탐?????");
		return repo.searchPw(search);
	}

	public MemberVo ModifyView(String id) {
		return repo.modifyView(id);
	}

	
	
	

}
